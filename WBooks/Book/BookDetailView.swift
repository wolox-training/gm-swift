//
//  BookDetailView.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 24/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore


class BookDetailView: UIView, NibLoadable {
    
    // MARK: - Properties
    @IBOutlet weak var title: UILabel!
    @IBOutlet var container: BookDetailView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("BookDetailView", owner: self, options: nil)
        addSubview(container)
        container.frame = self.bounds
        container.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    
}
