//
//  CommentCell.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 16/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class CommentCell: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var userPhoto: RoundedImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var commentContent: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
}

// MARK: - Private
private extension CommentCell {
    
    func setupView() {
        selectionStyle = UITableViewCellSelectionStyle.none
    }
    
}

