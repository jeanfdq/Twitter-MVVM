//
//  FactoryTabBar.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import UIKit

class FactoryTabBar: NSObject {
    
    class func home() -> TuplaImages {
        return (UIImage(systemName: "homekit"), UIImage(systemName: "homekit"))
    }
    
    class func search() -> TuplaImages {
        return (UIImage(systemName: "magnifyingglass"), UIImage(systemName: "magnifyingglass"))
    }
    
    class func favorities() -> TuplaImages {
        return (UIImage(systemName: "bell.badge"), UIImage(systemName: "bell.badge"))
    }
    
    class func chat() -> TuplaImages {
        return (UIImage(systemName: "envelope"), UIImage(systemName: "envelope"))
    }
    
}
