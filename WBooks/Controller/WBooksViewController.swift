//
//  WBooksViewController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 23/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class WBooksViewController: UIViewController {

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
