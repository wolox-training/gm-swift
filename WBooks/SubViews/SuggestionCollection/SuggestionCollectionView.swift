//
//  SuggestionCollection.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 29/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class SuggestionCollectionView: UIView {
    
    // MARK: - Properties
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var suggestionCollection: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadSuggestionCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadSuggestionCollectionView()
    }
    
    private func loadSuggestionCollectionView() {
        Bundle.main.loadNibNamed("SuggestionCollectionView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
