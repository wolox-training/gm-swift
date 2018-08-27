//
//  DetailsView.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 27/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

class DetailsView: UIView {
    
    // MARK - Properties
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var firstButton: HollowButton!
    @IBOutlet weak var secondButton: GradientButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadDetailsView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadDetailsView()
    }
    
    private func loadDetailsView() {
        Bundle.main.loadNibNamed("DetailsView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
