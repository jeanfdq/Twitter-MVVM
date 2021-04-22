//
//  UIColor.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import UIKit

extension UIColor {
    
    static func fromHexaToColor(_ hexa: String) -> UIColor {
        
        var cString = hexa.uppercased()
        
        if hexa.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if cString.count != 6 {
            return .lightGray
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        let redValue = CGFloat((rgbValue & 0xFF0000) >> 16)
        let greenValue = CGFloat((rgbValue & 0x00FF00) >> 8)
        let blueValue = CGFloat(rgbValue & 0x0000FF)
        
        return .init(red: redValue  / 255.0, green: greenValue / 255.0, blue: blueValue / 255.0, alpha: 1)
        
    }
    
    static func fromRGBToColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
