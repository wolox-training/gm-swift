//
//  CommentCell.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 16/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import UIKit
import WolmoCore

class CommentCell: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var userPhoto: RoundedImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var commentContent: UILabel!
    
}

