//
//  WishlistViewController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 22/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class WishlistViewController: UIViewController {
    
    private let wishlistView: WishlistView = WishlistView.loadFromNib()!
    private let viewModel: WishlistViewModel
    
    init(viewModel: WishlistViewModel = WishlistViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = wishlistView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
