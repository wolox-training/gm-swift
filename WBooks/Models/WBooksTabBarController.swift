//
//  WBooksTabBarController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 14/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class WBooksTabBarController: UITabBarController {
    
    private let backgroundColor = UIColor(red: 252, green: 254, blue: 254, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTabs()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let navigationBar = self.navigationController?.navigationBar
        
        navigationBar?.shadowImage = nil
        navigationBar?.setBackgroundImage(nil, for: .default)
        navigationBar?.isTranslucent = true
        
        navigationBar?.titleTextAttributes = UINavigationBar.appearance().titleTextAttributes
        navigationBar?.tintColor = UINavigationBar.appearance().tintColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let navigationBar = self.navigationController?.navigationBar
        
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
        navigationBar?.isTranslucent = true
        
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationBar?.titleTextAttributes = textAttributes
        navigationBar?.tintColor = UIColor.white
    }
    
}

// MARK: - Private
private extension WBooksTabBarController {
    
    func setupView() {
        tabBar.barTintColor = backgroundColor
    }
    
    func setupTabs() {
        
        let libraryViewController = LibraryViewController()
        let libraryTab = UITabBarItem(title: "Library", image: UIImage(named: "ic_library"), selectedImage: UIImage(named:"ic_library active"))
        libraryViewController.tabBarItem = libraryTab
        
        let wishlistViewController = WishlistViewController()
        let wishlistTab = UITabBarItem(title: "Wishlist", image: UIImage(named: "ic_wishlist"), selectedImage: UIImage(named:"ic_wishlist active"))
        wishlistViewController.tabBarItem = wishlistTab
        
        let addNewViewController = RecommendationViewController()
        let addNewTab = UITabBarItem(title: "Add New", image: UIImage(named: "ic_add new"), selectedImage: UIImage(named:"ic_add new active"))
        addNewViewController.tabBarItem = addNewTab
        
        let rentalsViewController = RentalsViewController()
        let rentalsTab = UITabBarItem(title: "Rentals", image: UIImage(named: "ic_myrentals"), selectedImage: UIImage(named:"ic_myrentals active"))
        rentalsViewController.tabBarItem = rentalsTab
        
        
        let tabBarList = [libraryViewController, wishlistViewController, addNewViewController, rentalsViewController]
        viewControllers = tabBarList
        navigationItem.title = tabBarList.first!.tabBarItem.title?.uppercased()
    }
    
    
}

internal extension WBooksTabBarController {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        navigationItem.title = item.title?.uppercased()
    }
    
}
