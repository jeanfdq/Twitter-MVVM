//
//  UIViewController.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 21/04/21.
//

import UIKit

extension UIViewController {
    
    func setupTabBar(tabImages: TuplaImages) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: self)
        nav.tabBarItem.image = tabImages.0?.withTintColor(Colors.customGray1).withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.selectedImage = tabImages.1?.withTintColor(Colors.mainColor).withRenderingMode(.alwaysOriginal)
        return nav
        
    }
    
    func presentViewController(_ viewController: UIViewController, transitionStyle: UIModalTransitionStyle = .coverVertical, presentaionStyle: UIModalPresentationStyle = .fullScreen, isAnimated: Bool = false) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            viewController.modalTransitionStyle = transitionStyle
            viewController.modalPresentationStyle = presentaionStyle
            self.present(viewController, animated: isAnimated)
        }
        
    }
}
