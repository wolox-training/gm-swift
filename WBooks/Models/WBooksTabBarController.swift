//
//  WBooksTabBarController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 14/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class WBooksTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let libraryViewController = LibraryViewController()
        let libraryTab = UITabBarItem(title: "Library", image: UIImage(named: "ic_library"), selectedImage: UIImage(named:"ic_library active"))
        libraryViewController.tabBarItem = libraryTab
        
        // TODO: Implementar 'Wish List'
        let wishlistViewController = LibraryViewController()
        let wishlistTab = UITabBarItem(title: "Wishlist", image: UIImage(named: "ic_wishlist"), selectedImage: UIImage(named:"ic_wishlist active"))
        wishlistViewController.tabBarItem = wishlistTab
        
        // TODO: Implementar 'Add New'
        let addNewViewController = LibraryViewController()
        let addNewTab = UITabBarItem(title: "Add New", image: UIImage(named: "ic_add new"), selectedImage: UIImage(named:"ic_add new active"))
        addNewViewController.tabBarItem = addNewTab
        
        // TODO: Implementar 'Rentals'
        let rentalsViewController = LibraryViewController()
        let rentalsTab = UITabBarItem(title: "Rentals", image: UIImage(named: "ic_myrentals"), selectedImage: UIImage(named:"ic_myrentals active"))
        rentalsViewController.tabBarItem = rentalsTab
        
        
        let tabBarList = [libraryViewController, wishlistViewController, addNewViewController, rentalsViewController]
        viewControllers = tabBarList
    }
    
    
}
