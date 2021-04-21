//
//  Bundle.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import Foundation

extension Bundle {
    
    static var local: Bundle {
        get {
            return Bundle(for: AppDelegate.self)
        }
    }
    
}
