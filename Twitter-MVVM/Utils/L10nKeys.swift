//
//  L10nKeys.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import Foundation

enum L10nKeys: String {
    
    // MARK: - MainAccount
    case labelCentral, createAccountBtnTitle, haveAlreadyAccount
}

extension L10nKeys {
    static let defaultStringFile = "Default"
    
    var localized: String {
        
        var result = Bundle.local.localizedString(forKey: self.rawValue, value: nil, table: nil)
        
        if result == self.rawValue {
            result = Bundle.local.localizedString(forKey: self.rawValue, value: nil, table: L10nKeys.defaultStringFile)
        }
        
        return result
    }
}
