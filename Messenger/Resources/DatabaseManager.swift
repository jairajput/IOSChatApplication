//
//  DatabaseManager.swift
//  Messenger
//
//  Created by Jai  on 30/04/23.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager{
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
}
// Mark Account Management

    /// Inserts New User To Database
    extension DatabaseManager{
        
        public func userExists(with email:String,completition: @escaping((Bool) -> Void)){
            database.child(email).observeSingleEvent(of: .value,with:{snapshot in
                
                guard snapshot.value as? String != nil else {
                   completition(false)
                    return
                }
                completition(true)
            })
        }
        
        public func insertUser(with user:ChatAppUser){
            database.child(user.emailAddress).setValue([
                "first_name":user.firstName,
                "last_name":user.lastName])
        
        
    }
    }
struct ChatAppUser{
    let firstName:String
    let lastName: String
    let emailAddress:String
}
  
    

