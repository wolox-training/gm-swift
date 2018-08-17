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

    // MARK: Properties
    @IBOutlet weak var bookPhoto: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookStatus: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookYear: UILabel!
    @IBOutlet weak var bookGenre: UILabel!
    @IBOutlet weak var addToWishlistButton: HollowButton!
    @IBOutlet weak var rentButton: GradientButton!
    @IBOutlet weak var tableView: UITableView!
    
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
