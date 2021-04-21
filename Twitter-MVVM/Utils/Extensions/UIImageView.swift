//
//  UIImageView.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import UIKit

extension UIImageView {
    
    func setNewHeightWidth(newWidth:CGFloat) -> CGSize {
        
        let nh = (frame.size.height * newWidth) / frame.size.width
        
        return CGSize(width: newWidth, height: nh)
    }
    
}
