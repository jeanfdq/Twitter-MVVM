//
//  Firebase.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import Firebase

class FIR: NSObject {
    
    class func instanceFirestore() -> Firestore {
        return Firestore.firestore()
    }
    
    class func instanceAuth() -> Auth {
        return Auth.auth()
    }
    
    class func instanceStorage() -> StorageReference {
        return Storage.storage().reference()
    }
    
}
