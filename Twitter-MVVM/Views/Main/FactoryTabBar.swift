//
//  FactoryTabBar.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import UIKit

class FactoryTabBar: NSObject {
    
    class func home() -> tuplaImages {
        return (UIImage(systemName: "homekit"), UIImage(systemName: "homekit"))
    }
    
    class func search() -> tuplaImages {
        return (UIImage(systemName: "magnifyingglass"), UIImage(systemName: "magnifyingglass"))
    }
    
    class func favorities() -> tuplaImages {
        return (UIImage(systemName: "bell.badge"), UIImage(systemName: "bell.badge"))
    }
    
    class func chat() -> tuplaImages {
        return (UIImage(systemName: "envelope"), UIImage(systemName: "envelope"))
    }
    
}
