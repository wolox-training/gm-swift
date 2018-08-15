//
//  BookViewController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 15/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class BookViewController: UIViewController {
    
    private let bookView: BookView = BookView.loadFromNib()!
    public var book: Book?
    
    override func loadView() {
        view = bookView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Init
    }
}

