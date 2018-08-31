//
//  CommentViewController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 30/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import WolmoCore

class CommentViewController: UIViewController {
    
    private let commentView: CommentView = CommentView.loadFromNib()!
    private let viewModel: CommentViewModel

    
    init(viewModel: CommentViewModel) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = commentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        commentView.commentTextView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarStyle()
    }
}

// MARK: - Private
private extension CommentViewController {
    
    private static let statusBarTitle = "COMMENT"
    private static let imagePlaceholder = "image_placeholder"
    
    func setupView() {
        setNavigationBar()
        setBookDetails()
        setSubmitButton()
    }
    
    func setNavigationBar() {
        navigationItem.title = CommentViewController.statusBarTitle
    }
    
    func setBookDetails() {
        let book: Book = viewModel.book
        
        commentView.detailsView.photo.image = UIImage(named: CommentViewController.imagePlaceholder)
        
        if let url = book.imageURL {
            commentView.detailsView.photo.load(url: url)
        }
        
        commentView.detailsView.title.text = book.title
        commentView.detailsView.author.text = book.author
        commentView.detailsView.year.text = book.year
        commentView.detailsView.genre.text = book.genre
    }
    
    func setSubmitButton() {
        commentView.submitButton.addTarget(self, action: #selector(submitButtonClicked(sender:)), for: .touchUpInside)
    }
    
    @objc func submitButtonClicked(sender : UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension CommentViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        let textView: SimpleTextView = commentView.commentTextView
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        let textView: SimpleTextView = commentView.commentTextView
        if textView.text.isEmpty {
            textView.text = SimpleTextView.defaultPlaceholder
            textView.textColor = UIColor.lightGray
        }
    }
    
}
