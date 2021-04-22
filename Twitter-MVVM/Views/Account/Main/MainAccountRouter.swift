//
//  MainAccountRouter.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import UIKit

final class MainAccountRouter: NSObject {
    
    let viewController: UIViewController
    let loginFactory: (() -> LoginViewController)
    let signUpFactory: (() -> SignUpViewController)
    
    init(_ viewController: UIViewController, _ loginFactory: @escaping(() -> LoginViewController), _ signUpFactory: @escaping(() -> SignUpViewController) ) {
        self.viewController = viewController
        self.loginFactory   = loginFactory
        self.signUpFactory  = signUpFactory
    }
    
    func goToLogin() {
        viewController.presentViewController(loginFactory())
    }
    
    func goToSignUp() {
        viewController.presentViewController(signUpFactory())
    }
    
}
