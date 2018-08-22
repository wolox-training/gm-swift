//
//  SuggestionCell.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 22/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class SuggestionCell: UICollectionViewCell, NibLoadable {

    @IBOutlet weak var bookPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

}

private extension SuggestionCell {
    
    func setupView() {
        
    }
    
}
