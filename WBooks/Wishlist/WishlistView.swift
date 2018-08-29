//
//  WishlistView.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 22/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class WishlistView: UIView, NibLoadable {
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
}

// MARK: - Private
private extension WishlistView {
    
    func setupView() {
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
}
