//
//  UIViewControllerExtension.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 24/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    func setNavigationBarStyle() {
        let navigationBar = self.navigationController?.navigationBar
        
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
        navigationBar?.isTranslucent = true
        
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationBar?.titleTextAttributes = textAttributes
        navigationBar?.tintColor = UIColor.white
    }
    
}

