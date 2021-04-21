//
//  FIRAuth.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import Foundation

class FIRAuth: NSObject {
    
    private let instance = FIR.instanceAuth()
    
    func currentUserId() -> String? {
        return instance.currentUser?.uid
    }
    
}
