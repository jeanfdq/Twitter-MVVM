//
//  UIView.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import UIKit

extension UIView {
    
    func setCorner(radius:CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func setBorder(_ color:UIColor, _ width:CGFloat) {
        layer.borderColor   = color.cgColor
        layer.borderWidth   = width
    }
    
    func setShadow(color:UIColor = .black ,radius: CGFloat, opacity:Float, offSet: CGSize = .init(width: 1, height: 1)){
        layer.shadowColor   = color.cgColor
        layer.shadowRadius  = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset  = offSet
        layer.masksToBounds = false
    }
    
    func addSubViews(_ views: UIView...){
        for view in views {
            addSubview(view)
        }
    }
    
    func applyViewIntoSuperView(value:UIEdgeInsets = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        leadingAnchor.constraint(equalTo: superview?.leadingAnchor ?? NSLayoutXAxisAnchor(), constant: value.left).isActive = true
        topAnchor.constraint(equalTo: superview?.topAnchor ?? NSLayoutYAxisAnchor(), constant: value.top).isActive = true
        trailingAnchor.constraint(equalTo: superview?.trailingAnchor ?? NSLayoutXAxisAnchor(), constant: value.right).isActive = true
        bottomAnchor.constraint(equalTo: superview?.bottomAnchor ?? NSLayoutYAxisAnchor(), constant: value.bottom).isActive = true
        
    }
    
    func applyViewConstraints( leading: NSLayoutXAxisAnchor? = nil,  top:NSLayoutYAxisAnchor? = nil,  trailing:NSLayoutXAxisAnchor? = nil,  bottom:NSLayoutYAxisAnchor? = nil, centerX:NSLayoutXAxisAnchor? = nil, centerY:NSLayoutYAxisAnchor? = nil, size:CGSize = .zero, value:UIEdgeInsets = .zero ){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: value.left).isActive = true
        }
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: value.top).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: value.right * (-1)).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: value.bottom * (-1)).isActive = true
        }
        
        if let centerYSuperView = centerY {
            centerYAnchor.constraint(equalTo: centerYSuperView).isActive = true
        }
        
        if let centerXSuperView = centerX {
            centerXAnchor.constraint(equalTo: centerXSuperView).isActive = true
        }
        
        if size.width != .zero {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != .zero {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
    
    func applyCenterIntoSuperView(size:CGSize = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerYSuperView = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: centerYSuperView).isActive = true
        }
        
        if let centerXSuperView = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: centerXSuperView).isActive = true
        }
        
        if size.height != .zero {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
        if size.width != .zero {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
    }
    
    func applyJustSize(size:CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if size.width != .zero {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != .zero {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }

    func  addTapGesture(action : @escaping ()->Void ){
        let tap = MyTapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
        tap.action = action
        tap.numberOfTapsRequired = 1
        
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        
    }
    @objc func handleTap(_ sender: MyTapGestureRecognizer) {
        sender.action!()
    }
}

class MyTapGestureRecognizer: UITapGestureRecognizer {
    var action : (()->Void)? = nil
}
