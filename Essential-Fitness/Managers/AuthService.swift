//
//  AuthService.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/6/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    // this is a shared singleton
    public static let shared = AuthService()
    private init() {}
    
    // use command + option + / or ? to genarate documentation
    
    /// A method to register the user
    /// - Parameters:
    ///   - userRequest: The users information (email, password, username)
    ///   - completion: A completion with two values...
    ///   - Bool: wasRegistered - Determines if the user was registered and saved in the database correctly
    ///   - Error?: An optional error if firebase provides once
    public func registerUser(with userRequest: RegiserUserRequest, completion: @escaping (Bool, Error?)->Void) {
        let username = userRequest.username
        let email = userRequest.email
        let password = userRequest.password
        // completion handler work like async way. it is better to use when dealing with API or time consuming tasks
        // this  result, error is the completion
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return // to stop the function
            }
            
            guard let resultUser = result?.user else {
                // completion handler work like async way. it is better to use when dealing with API or time consuming tasks
                // else we didnt do the registrtion correcly so we didint get the user back
                completion(false, nil)
                return
            }
            
            let db = Firestore.firestore()
            // going in to th users collection
            // we can initilaise a document for the user with the firebase given UID for the created user
            // create the  dictionary for registered user with username and email
            db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "username": username,
                    "email": email
                ]) { error in
                    // this is the completion handle for the firestore database.
                    if let error = error {
                        // completion handler work like async way. it is better to use when dealing with API or time consuming tasks
                        completion(false, error)
                        return
                    }
                    // completion handler work like async way. it is better to use when dealing with API or time consuming tasks
                    completion(true, nil)
                }
        }
    }
    
    // overlaod method with email and password
    public func signIn(with userRequest: LoginUserRequest, completion: @escaping (Error?)->Void) {
        Auth.auth().signIn(
            withEmail: userRequest.email,
            password: userRequest.password
        ) { result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
            }
        }
    }
    
    public func signOut(completion: @escaping (Error?)->Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
    
    public func forgotPassword(with email: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
        }
    }
    
    public func fetchUser(completion: @escaping (User?, Error?) -> Void) {
        guard let userUID = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        // GET user from the user Collection using current user UID
        db.collection("users")
            .document(userUID)
            .getDocument { snapshot, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                // document snapShot, and snapshotData is a Dictionary
                if let snapshot = snapshot,
                   let snapshotData = snapshot.data(),
                   let username = snapshotData["username"] as? String,
                   let email = snapshotData["email"] as? String,
                   let weight = snapshotData["weight"] as? String,
                   let height = snapshotData["height"] as? String,
                   let finessGoal = snapshotData["finessGoal"] as? String,
                   let birthday = snapshotData["birthday"] as? String{
                    let user = User(username: username, email: email, userUID: userUID, weight: weight, height: height, finessGoal: finessGoal, birthday: birthday)
                    completion(user, nil)
                }
                
            }
    }
    
    //if let User = User{
      //  // do somethig
   // }
    
    public func updateUser(with updateUser: UpdateUser,completion: @escaping (Error?) -> Void){
        
        guard let userUID = Auth.auth().currentUser?.uid else { return }
        
        let data = ["height" : updateUser.height,
                    "weight" : updateUser.weight,
                    "finessGoal" : updateUser.finessGoal,
                    "birthday" : updateUser.birthday]
        
           Firestore.firestore().collection("users")
               .document(userUID)
               .updateData(data) { error in
                print("DEBUG: User data Update successfully \("")\n\n")
                    if let error = error {
                        completion(error)
                        return
                    } else {
                        completion(nil)
                    }
               }
           }
}
