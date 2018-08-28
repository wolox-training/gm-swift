//
//  LibraryView.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 13/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class LibraryView: UIView, NibLoadable {
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
}

// MARK: - Private
private extension LibraryView {
    
    func setupView() {
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
}
