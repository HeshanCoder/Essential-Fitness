//
//  APICaller.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/6/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


// use dev doc for hemoviedb.org
struct Constants {
    //static let API_KEY = "f81916692ac224fd863aee5a74c973e0"
    //static let baseURL = "https://api.themoviedb.org"
    /// go to google dev conosle create a project create credential get the API key
    /// got to the YouTube API and follow the documentation
    static let YoutubeAPI_KEY = "AIzaSyDIPrSLgGLxX67mAXuGvT8kvsE8mklRGys"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
    
}

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
                let video_URL = docSnapShot["video_URL"] as? String
                
                return Workout(id: doc.documentID, media_type: media_type, original_name: original_name, original_title: original_title, poster_path: poster_path, overview: overview, calories_count: calories_count, reps_and_sets: reps_and_sets, minute_average: minute_average,video_URL: video_URL)
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
                let video_URL = docSnapShot["video_URL"] as? String
                
                return Workout(id: doc.documentID, media_type: media_type, original_name: original_name, original_title: original_title, poster_path: poster_path, overview: overview, calories_count: calories_count, reps_and_sets: reps_and_sets, minute_average: minute_average,video_URL: video_URL)
            }
            
            //print(upperbodyworkoutwehghtlossCollection)
            completion(.success(upperbodyworkoutwehghtlossCollection))
        }
    }
    
    func getUpcomingWorkouts(completion: @escaping (Result<[Workout], Error>) -> Void) {
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
                let video_URL = docSnapShot["video_URL"] as? String
                
                return Workout(id: doc.documentID, media_type: media_type, original_name: original_name, original_title: original_title, poster_path: poster_path, overview: overview, calories_count: calories_count, reps_and_sets: reps_and_sets, minute_average: minute_average,video_URL: video_URL)
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
                let video_URL = docSnapShot["video_URL"] as? String
                
                return Workout(id: doc.documentID, media_type: media_type, original_name: original_name, original_title: original_title, poster_path: poster_path, overview: overview, calories_count: calories_count, reps_and_sets: reps_and_sets, minute_average: minute_average,video_URL: video_URL)
            }
            
            //print(upperbodyworkoutwehghtlossCollection)
            completion(.success(upperbodyworkoutwehghtlossCollection))
        }
    }
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
            
            
            guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
            guard let url = URL(string: "\(Constants.YoutubeBaseURL)q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else {return}
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                    
                    completion(.success(results.items[0]))
                    
                    
                } catch {
                    completion(.failure(error))
                    print(error.localizedDescription)
                }
                
            }
            task.resume()
        }
    
}












