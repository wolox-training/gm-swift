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

class RecommendationView: UIView, NibLoadable, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var bookPhoto: UIImageView!
    @IBOutlet weak var bookName: SimpleTextField!
    @IBOutlet weak var bookAuthor: SimpleTextField!
    @IBOutlet weak var bookYear: SimpleTextField!
    @IBOutlet weak var bookTopic: SimpleTextField!
    @IBOutlet weak var bookDescription: UITextField!
    @IBOutlet weak var submitButton: GradientButton!
    @IBOutlet weak var imagePickerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    
    @IBAction func submit(_ sender: Any) {
        print("Submit button pressed")
    }
    
}

// MARK: - Private
private extension RecommendationView {
    
    func setupView() {
        bookName.placeholder = "Book's name"
        bookAuthor.placeholder = "Author"
        bookYear.placeholder = "Year"
        bookTopic.placeholder = "Topic"
        bookDescription.placeholder = "Description"
    }
    
}

