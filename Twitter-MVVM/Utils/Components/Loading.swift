//
//  Loading.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import UIKit

class Loading: NSObject {
    
    private var rootView: UIView?
    private let blackBackgroud = UIView()
    private let loading = UIActivityIndicatorView(style: .large)
    var isLoading = false
    
    func startLoading(in root: UIView ) {
        
        self.rootView = root
        
        blackBackgroud.backgroundColor = .init(white: 0.4, alpha: 0.7)
        
        loading.color = .white
        loading.startAnimating()
        isLoading  = true
        
        rootView?.addSubViews(blackBackgroud, loading)
        blackBackgroud.applyCenterIntoSuperView(size: root.frame.size)
        loading.applyCenterIntoSuperView(size: .init(width: 100, height: 100))
        
    }
    
    func stopLoading() {
        loading.removeFromSuperview()
        blackBackgroud.removeFromSuperview()
        loading.stopAnimating()
        isLoading = false
    }
    
}
