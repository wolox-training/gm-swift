//
//  CommentView.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 30/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class CommentView: UIView, NibLoadable {

    // MARK: - Properties
    @IBOutlet weak var detailsView: DetailsView!
    @IBOutlet weak var commentTextView: SimpleTextView!
    @IBOutlet weak var submitButton: GradientButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
}

private extension CommentView {
    
    func setupView() {
        detailsView.status.text = .none
        detailsView.buttonContainer.isHidden = true
        
        submitButton.setTitle("SUBMIT", for: .normal)
    }
    
}
