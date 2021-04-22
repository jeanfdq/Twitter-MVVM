//
//  UIFont.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import UIKit

extension UIFont {
    static func semiBold(size: CGFloat) {
        self.systemFont(ofSize: size, weight: .semibold)
    }
    static func bold(size: CGFloat) {
        self.systemFont(ofSize: size, weight: .bold)
    }
    static func regular(size: CGFloat) {
        self.systemFont(ofSize: size, weight: .regular)
    }
}
