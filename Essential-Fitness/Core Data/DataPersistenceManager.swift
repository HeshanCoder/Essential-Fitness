//
//  DataPersistenceManager.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/8/23.
//

import Foundation

import Foundation
import UIKit
import CoreData

// responsible for downloading the data and work and talk with core data API
// It is not good practice to call core data API from directly where it uses.
// so keep seperate classes for access core data is the best practice
class DataPersistenceManager {
    
    // to pass defferent kind of errors
    enum DatabasError: Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeleteData
    }
    
    // create a shared isntance across the appication
    static let shared = DataPersistenceManager()
    
    
    // downloading a title with model and that pass from collectionTableViewCell.
    // we have complesion handler and it return a result of Result<Void, Error>
    func downloadTitleWith(model: Workout, completion: @escaping (Result<Void, Error>) -> Void) {
        // we want to save the data that passing to this method.
        // saving data in the persistance model is 2 step proccess
        
        // we want to tell to context manager that we want to save somthing ( exactly what we gonna be saving inside our database)
        // then tell to the context mabager or the contex API to store that data solid in the database
        
        // need a reference to the app delegate ( to access Context Manager)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        // we want context as well ( to access Context Manager)
        let context = appDelegate.persistentContainer.viewContext
        
        // this is the item that we want to save. use this way to use supervision from context
        let item = WorkoutItems(context: context)
        
        item.id = model.id
        item.media_type = model.media_type
        item.original_name = model.original_name
        item.original_title = model.original_title
        item.poster_path = model.poster_path
        item.overview = model.overview
        item.calories_count = Int64(model.calories_count!)
        item.reps_and_sets = model.reps_and_sets
        item.minute_average = model.minute_average
        item.video_URL = model.video_URL
        
        
        do {
            try context.save()
            completion(.success(())) // to pass void in success call we have to use empty()
        } catch {
            completion(.failure(DatabasError.failedToSaveData))
        }
    }
    
    
    func fetchingTitlesFromDataBase(completion: @escaping (Result<[WorkoutItems], Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        // making a request to access the context manager
        let request: NSFetchRequest<WorkoutItems>
        
        // redinag the requtst to execute
        request = WorkoutItems.fetchRequest()
        
        do {
            
            let workouts = try context.fetch(request)
            completion(.success(workouts))
            
        } catch {
            completion(.failure(DatabasError.failedToFetchData))
        }
    }
    
    func deleteTitleWith(model: WorkoutItems, completion: @escaping (Result<Void, Error>)-> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model) // asking to delete the recored.  softly deleted
        
        do {
            try context.save() // confirm the deledion
            completion(.success(()))
        } catch {
            completion(.failure(DatabasError.failedToDeleteData))
        }
        
    }
}
