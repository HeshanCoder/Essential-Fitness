//
//  Workout.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/6/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

//: Codable protoal to encode or decode
struct TrendingWorkoutRespons: Codable {
     // multiple on this
    var results: [Workout?]
 }
/*
struct Workout: Codable, Identifiable {
     @DocumentID var id: String?
    var media_type: String?
    var original_name: String?
    var original_title: String?
    var poster_path: String?
    var overview: String?
    var calories_count: Int
    var reps_and_sets: String?
    var minute_average: Double
 }
*/
struct Workout: Codable{
    var id: String?
    var media_type: String?
    var original_name: String?
    var original_title: String?
    var poster_path: String?
    var overview: String?
    var calories_count: Int?
    var reps_and_sets: String?
    var minute_average: String?
    var video_URL: String?
 }
/*
 struct Book: Identifiable, Codable {
   @DocumentID var id: String?
   var title: String
   var author: String
   var numberOfPages: Int
   
   enum CodingKeys: String, CodingKey {
     case id
     case title
     case author
     case numberOfPages = "pages"
   }
 }
 
 */
