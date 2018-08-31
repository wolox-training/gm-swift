//
//  RecommendationView.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 21/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class RecommendationView: UIView, NibLoadable {
    
    @IBOutlet weak var bookPhoto: UIImageView!
    @IBOutlet weak var bookName: SimpleTextField!
    @IBOutlet weak var bookAuthor: SimpleTextField!
    @IBOutlet weak var bookYear: SimpleTextField!
    @IBOutlet weak var bookTopic: SimpleTextField!
    @IBOutlet weak var bookDescription: SimpleTextField!
    @IBOutlet weak var submitButton: GradientButton!
    @IBOutlet weak var imagePickerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
}

// MARK: - Private
private extension RecommendationView {
    
    func setupView() {
        bookName.setPlaceholder(text: "Book's name")
        bookAuthor.setPlaceholder(text: "Author")
        bookYear.setPlaceholder(text: "Year")
        bookTopic.setPlaceholder(text: "Topic")
        bookDescription.setPlaceholder(text: "Description")
    }
    
}

