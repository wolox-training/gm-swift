//
//  WBooksSearchBar.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 28/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit

class WBooksSearchBar: UISearchBar {
    
    private static let height: CGFloat = 20.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(containerView: UIView) {
        let frame = CGRect(x: 0, y: 0, width: containerView.bounds.width, height: WBooksSearchBar.height)
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
