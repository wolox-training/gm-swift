//
//  LibraryViewController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 13/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit

class LibraryViewController: UIViewController {
    
    private let libraryView: LibraryView = Bundle.main.loadNibNamed("LibraryView", owner: self, options: nil)?.first as! LibraryView
    
    override func loadView() {
        view = libraryView
    }
    
}
