//
//  LibraryCell.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 13/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class LibraryCell: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var libraryPhoto: UIImageView!
    @IBOutlet weak var libraryTitle: UILabel!
    @IBOutlet weak var libraryAuthor: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
}

// MARK: - Private
private extension LibraryCell {
    
    func setupView() {
        selectionStyle = UITableViewCellSelectionStyle.none
    }
    
}
