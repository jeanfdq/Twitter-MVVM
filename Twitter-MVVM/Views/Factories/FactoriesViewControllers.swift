//
//  FactoriesViewControllers.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import Foundation

func makeMainTabBar() -> MainTabBarController {
    let vc = MainTabBarController()
    return vc
}

func makeMainAccount() -> MainAccountViewController {
    let vc = MainAccountViewController()
    
    let loginFactory: () -> LoginViewController = {
        return makeLogin()
    }
    
    let signUpFactory: () -> SignUpViewController = {
        return makeSignUp()
    }
    
    let router = MainAccountRouter(vc, loginFactory, signUpFactory)
    
    vc.goToLogin    = router.goToLogin
    vc.goToSignUp   = router.goToSignUp
    
    return vc
}

func makeLogin() -> LoginViewController {
    let vc = LoginViewController()
    return vc
}

func makeSignUp() -> SignUpViewController {
    let vc = SignUpViewController()
    return vc
}
