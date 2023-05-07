//
//  TestAPIs.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/7/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TestAPIs{
    private var workout: Workout?
    private var workouts = [Workout?]()
    //private var workouts = TrendingWorkoutRespons()
    
    public func fetchUpperBodyWorkout(completion: @escaping (Result<[Workout?], Error>) -> Void) {
        let db = Firestore.firestore()
        
        db.collection("upperbodyworkoutwehghtloss").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                completion(.failure(APIError.failedTogetData))
                return
            }
            print("fetchUpperBodyWorkout - documents")
            print(documents)
            // self.workouts = documents.compactMap { queryDocumentSnapshot -> Workout? in
            //     return try? queryDocumentSnapshot.data(as: Workout.self)
            // }
            /*
             for document in querySnapshot!.documents {
             print("\(document.documentID) => \(document.data())")
             
             if let document = document as? QueryDocumentSnapshot,
             let documentData = document.data() as? NSDictionary,
             let id = document.documentID as? String,
             let media_type = documentData["media_type"] as? String,
             let original_name = documentData["original_name"] as? String,
             let original_title = documentData["original_title"] as? String,
             let poster_path = documentData["poster_path"] as? String,
             let overview = documentData["overview"] as? String,
             let calories_count = documentData["calories_count"] as? Int,
             let reps_and_sets = documentData["reps_and_sets"] as? String,
             let minute_average = documentData["minute_average"] as? Double
             {
             let wK = Workout(id: id, media_type: media_type, original_name: original_name, original_title: original_title, poster_path: poster_path, overview: overview, calories_count: calories_count, reps_and_sets: reps_and_sets, minute_average: minute_average)
             print("vk")
             print(wK)
             self.workouts.append(wK)
             }
             }
             */
            
            //let trendingWorkoutRespons = TrendingWorkoutRespons.init(results: self.workouts)
            
            print("fetchUpperBodyWorkout - in")
            print(self.workouts)
            completion(.success(self.workouts))
            //print(self.workouts)
            //let results = try JSONDecoder().decode(TrendingMoviesRespons.self, from: data) // getting data
            //print(results)
            
        }
        print("fetchUpperBodyWorkout - out")
        print(self.workouts)
        completion(.success(self.workouts))
    }
    
    
    
    
}



//https://github.com/firebase/snippets-ios/blob/c7e0ea1552c57c372500e1f9efb9c66bc73d41ba/firestore/swift/firestore-smoketest/ViewController.swift#L834-L842
// https://peterfriese.dev/posts/swiftui-firebase-codable/
//https://peterfriese.dev/posts/firestore-codable-the-comprehensive-guide/
//https://firebase.google.com/docs/firestore/solutions/swift-codable-data-mapping

/*
 public func fetchUpperBodyWorkout(completion: @escaping (Result<[Workout?], Error>) -> Void) {
 let db = Firestore.firestore()
 
 // GET user from the user Collection using current user UID
 db.collection("c")
 .getDocuments() { querySnapshot, error in
 
 let docs = querySnapshot?.documents.;
 guard let data = docs, error == nil else {
 return
 }
 
 do{
 let results = try JSONDecoder().decode(TrendingWorkoutRespons.self, from: data) // getting data
 //print(results)
 completion(.success(results.results))
 }catch{
 completion(.failure(APIError.failedTogetData))
 }
 }
 
 db.collection("v").addSnapshotListener { (querySnapshot, error) in
 guard let documents = querySnapshot?.documents else {
 print("No documents")
 return
 }
 
 let workout = documents.compactMap { queryDocumentSnapshot -> Workout? in
 return try? queryDocumentSnapshot.data(with: Workout)
 }
 // let books = documents.map { queryDocumentSnapshot -> Workout in
 //let data = queryDocumentSnapshot.data()
 //let id = data["id"] as? String ?? ""
 //let title = data["title"] as? String ?? ""
 // let author = data["author"] as? String ?? ""
 // let numberOfPages = data["pages"] as? Int ?? 0
 
 //return Workout(id: id, title: title, author: author, numberOfPages: numberOfPages)
 }
 }
 */
