//
//  RentedBookController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 29/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import WolmoCore

class RentedBookViewController: BookViewController {
    
    override func setButtons() {
        bookView.detailsView.firstButton.setTitle("ADD A COMMENT", for: .normal)
        bookView.detailsView.secondButton.setTitle("RETURN BOOK", for: .normal)
    }
    
    override func setSuggestionCollection() {
        bookView.suggestionContainer.isHidden = false
    }
}
