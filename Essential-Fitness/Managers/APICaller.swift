//
//  APICaller.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/6/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// create an error
enum APIError: Error {
    case failedTogetData
}

class APICaller {
    // create shared isntant. so we can call all over the method in here
    static let shared = APICaller()

    public func fetchUpperBodyWorkouttest(completion: @escaping (Result<[Workout?], Error>) -> Void) {
        
        let db = Firestore.firestore()
        let collection = db.collection("upperbodyworkoutwehghtloss")
        
        collection.getDocuments { result, error in
            guard let data = result, error == nil else {
                completion(.failure(APIError.failedTogetData))
                return
            }
            
            let upperbodyworkoutwehghtlossCollection =  data.documents.map{ doc -> Workout in
                //print(doc.data())
                let docSnapShot = doc.data()
                
                let media_type = docSnapShot["media_type"] as? String
                let original_name = docSnapShot["original_name"] as? String
                let original_title = docSnapShot["original_title"] as? String
                let poster_path = docSnapShot["poster_path"] as? String
                let overview = docSnapShot["overview"] as? String
                let calories_count = docSnapShot["calories_count"] as? Int
                let reps_and_sets = docSnapShot["reps_and_sets"] as? String
                let minute_average = docSnapShot["minute_average"] as? String
                
                return Workout(id: doc.documentID, media_type: media_type, original_name: original_name, original_title: original_title, poster_path: poster_path, overview: overview, calories_count: calories_count, reps_and_sets: reps_and_sets, minute_average: minute_average)
            }
            
            //print(upperbodyworkoutwehghtlossCollection)
            completion(.success(upperbodyworkoutwehghtlossCollection))
        }
        
    }
    
    
    func getTrendingExersices(completion: @escaping (Result<[Workout], Error>) -> Void) {
        let db = Firestore.firestore()
        let collection = db.collection("upperbodyworkoutwehghtloss")
        
        collection.getDocuments { result, error in
            guard let data = result, error == nil else {
                completion(.failure(APIError.failedTogetData))
                return
            }
            
            let upperbodyworkoutwehghtlossCollection =  data.documents.map{ doc -> Workout in
                //print(doc.data())
                let docSnapShot = doc.data()
                
                let media_type = docSnapShot["media_type"] as? String
                let original_name = docSnapShot["original_name"] as? String
                let original_title = docSnapShot["original_title"] as? String
                let poster_path = docSnapShot["poster_path"] as? String
                let overview = docSnapShot["overview"] as? String
                let calories_count = docSnapShot["calories_count"] as? Int
                let reps_and_sets = docSnapShot["reps_and_sets"] as? String
                let minute_average = docSnapShot["minute_average"] as? String
                
                return Workout(id: doc.documentID, media_type: media_type, original_name: original_name, original_title: original_title, poster_path: poster_path, overview: overview, calories_count: calories_count, reps_and_sets: reps_and_sets, minute_average: minute_average)
            }
            
            //print(upperbodyworkoutwehghtlossCollection)
            completion(.success(upperbodyworkoutwehghtlossCollection))
        }
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Workout], Error>) -> Void) {
        let db = Firestore.firestore()
        let collection = db.collection("upperbodyworkoutwehghtloss")
        
        collection.getDocuments { result, error in
            guard let data = result, error == nil else {
                completion(.failure(APIError.failedTogetData))
                return
            }
            
            let upperbodyworkoutwehghtlossCollection =  data.documents.map{ doc -> Workout in
                //print(doc.data())
                let docSnapShot = doc.data()
                
                let media_type = docSnapShot["media_type"] as? String
                let original_name = docSnapShot["original_name"] as? String
                let original_title = docSnapShot["original_title"] as? String
                let poster_path = docSnapShot["poster_path"] as? String
                let overview = docSnapShot["overview"] as? String
                let calories_count = docSnapShot["calories_count"] as? Int
                let reps_and_sets = docSnapShot["reps_and_sets"] as? String
                let minute_average = docSnapShot["minute_average"] as? String
                
                return Workout(id: doc.documentID, media_type: media_type, original_name: original_name, original_title: original_title, poster_path: poster_path, overview: overview, calories_count: calories_count, reps_and_sets: reps_and_sets, minute_average: minute_average)
            }
            
            //print(upperbodyworkoutwehghtlossCollection)
            completion(.success(upperbodyworkoutwehghtlossCollection))
        }
        
    }
    
    func getPopular(completion: @escaping (Result<[Workout], Error>) -> Void) {
        
        let db = Firestore.firestore()
        let collection = db.collection("upperbodyworkoutwehghtloss")
        
        collection.getDocuments { result, error in
            guard let data = result, error == nil else {
                completion(.failure(APIError.failedTogetData))
                return
            }
            
            let upperbodyworkoutwehghtlossCollection =  data.documents.map{ doc -> Workout in
                //print(doc.data())
                let docSnapShot = doc.data()
                
                let media_type = docSnapShot["media_type"] as? String
                let original_name = docSnapShot["original_name"] as? String
                let original_title = docSnapShot["original_title"] as? String
                let poster_path = docSnapShot["poster_path"] as? String
                let overview = docSnapShot["overview"] as? String
                let calories_count = docSnapShot["calories_count"] as? Int
                let reps_and_sets = docSnapShot["reps_and_sets"] as? String
                let minute_average = docSnapShot["minute_average"] as? String
                
                return Workout(id: doc.documentID, media_type: media_type, original_name: original_name, original_title: original_title, poster_path: poster_path, overview: overview, calories_count: calories_count, reps_and_sets: reps_and_sets, minute_average: minute_average)
            }
            
            //print(upperbodyworkoutwehghtlossCollection)
            completion(.success(upperbodyworkoutwehghtlossCollection))
        }
    }
    
}












