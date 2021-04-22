//
//  UIView.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import UIKit

extension UIView {
    
    func setCorner(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func setBorder(_ color: UIColor, _ width: CGFloat) {
        layer.borderColor   = color.cgColor
        layer.borderWidth   = width
    }
    
    func setShadow( color: UIColor = .black, radius: CGFloat, opacity: Float, offSet: CGSize = .init(width: 1, height: 1)) {
        layer.shadowColor   = color.cgColor
        layer.shadowRadius  = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset  = offSet
        layer.masksToBounds = false
    }
    
    func addSubViews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    enum PaddingType {
        case left( CGFloat )
        case right( CGFloat )
        case top( CGFloat )
        case bottom( CGFloat )
    }

    func applyViewIntoSuperView(paddings: [PaddingType] = []) {
        translatesAutoresizingMaskIntoConstraints = false
        
        var paddingLeft: CGFloat = 0
        var paddingRight: CGFloat = 0
        var paddingTop: CGFloat = 0
        var paddingBottom: CGFloat = 0
        
        for padding in paddings {
            
            switch padding {
            case .left (let value): paddingLeft = value
            case .right (let value): paddingRight = value
            case .top (let value): paddingTop = value
            case .bottom (let value): paddingBottom = value
            }
        }
        
        leadingAnchor.constraint(equalTo: superview?.leadingAnchor ?? NSLayoutXAxisAnchor(), constant: paddingLeft).isActive = true
        topAnchor.constraint(equalTo: superview?.topAnchor ?? NSLayoutYAxisAnchor(), constant: paddingTop).isActive = true
        trailingAnchor.constraint(equalTo: superview?.trailingAnchor ?? NSLayoutXAxisAnchor(), constant: paddingRight * (-1)).isActive = true
        bottomAnchor.constraint(equalTo: superview?.bottomAnchor ?? NSLayoutYAxisAnchor(), constant: paddingBottom * (-1)).isActive = true
        
    }
    
    func applyViewConstraints( leading: NSLayoutXAxisAnchor? = nil, top: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, size: CGSize = .zero, constants: [PaddingType] = [] ) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var paddingLeft: CGFloat = 0
        var paddingRight: CGFloat = 0
        var paddingTop: CGFloat = 0
        var paddingBottom: CGFloat = 0
        
        for padding in constants {
            
            switch padding {
            case .left (let value): paddingLeft = value
            case .right (let value): paddingRight = value
            case .top (let value): paddingTop = value
            case .bottom (let value): paddingBottom = value
            }
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: paddingRight * (-1)).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom * (-1)).isActive = true
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
    
    func applyCenterIntoSuperView(size: CGSize = .zero) {
        
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
    
    func applyJustSize(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if size.width != .zero {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != .zero {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }

    func  addTapGesture(action : @escaping () -> Void ) {
        let tap = MyTapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
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
    var action : (() -> Void)?
}
