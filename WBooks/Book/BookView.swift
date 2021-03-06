//
//  BookView.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 15/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class BookView: UIView, NibLoadable {

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var detailsView: DetailsView!
    @IBOutlet weak var suggestionContainer: SuggestionCollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
}

// MARK: - Private
private extension BookView {
    
    func setupView() {
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
}
