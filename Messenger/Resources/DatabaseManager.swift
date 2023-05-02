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
    extension DatabaseManager{
        
        public func userExists(with email:String,completition: @escaping((Bool) -> Void)){
            
            var safeEmail = email.replacingOccurrences(of: ".", with: "-")
            safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
            
            
            database.child(safeEmail).observeSingleEvent(of: .value,with:{snapshot in
                
                guard snapshot.value as? String != nil else {
                   completition(false)
                    return
                }
                completition(true)
            })
        }
        
        public func insertUser(with user:ChatAppUser){
            database.child(user.safeEmail).setValue([
                "first_name":user.firstName,
                "last_name":user.lastName])
        
        
    }
    }
struct ChatAppUser{
    let firstName:String
    let lastName: String
    let emailAddress:String
    
    var safeEmail:String{
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
        
    }
}
  
    

