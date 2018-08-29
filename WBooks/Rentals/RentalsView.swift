//
//  RentalsView.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 22/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class RentalsView: UIView, NibLoadable {
    
    // MARK: - Properties
    @IBOutlet weak var rentsTableView: UITableView!
    @IBOutlet weak var suggestionContainer: SuggestionCollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
}

// MARK: - Private
private extension RentalsView {
    
    func setupView() {
        rentsTableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
}
