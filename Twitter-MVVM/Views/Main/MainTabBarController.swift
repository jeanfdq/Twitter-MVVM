//
//  MainTabBarController.swift
//  Twitter-MVVM
//
//  Created by Jean Paul Borges Manzini on 20/04/21.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupControllers()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        verifyUserLogged()
    }
    
    // MARK: - functions
    
    fileprivate func setupUI() {
        view.backgroundColor = .white
        tabBar.barStyle = .default
        tabBar.barTintColor = .white
    }
    
    fileprivate func setupControllers() {
        let home = HomeViewController().setupTabBar(tabImages: FactoryTabBar.home())
        let search = SearchViewController().setupTabBar(tabImages: FactoryTabBar.search())
        let favorities = FavoritiesViewController().setupTabBar(tabImages: FactoryTabBar.favorities())
        let chat = ChatViewController().setupTabBar(tabImages: FactoryTabBar.chat())
        
        viewControllers = [home, search, favorities, chat]
    }
    
    fileprivate func verifyUserLogged() {
        
        if let userID = FIRAuth().currentUserId() {
            
        } else {
            self.presentViewController(makeMainAccount())
        }
        
    }
    
}
