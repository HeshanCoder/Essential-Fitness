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
}
