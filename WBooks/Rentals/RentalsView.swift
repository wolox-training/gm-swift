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
    
    @IBOutlet weak var suggestionCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
}

// MARK: - Private
private extension RentalsView {
    
    func setupView() {
        
    }
    
}
