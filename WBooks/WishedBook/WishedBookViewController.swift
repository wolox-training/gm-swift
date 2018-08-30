//
//  WishedBookViewController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 30/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import WolmoCore

class WishedBookViewController: BookViewController {
    
    override func setButtons() {
        bookView.detailsView.firstButton.setTitle("REMOVE FROM WISHLIST", for: .normal)
        bookView.detailsView.secondButton.setTitle("RENT", for: .normal)
    }
    
    override func setSuggestionCollection() {
        bookView.suggestionContainer.isHidden = false
    }
}

