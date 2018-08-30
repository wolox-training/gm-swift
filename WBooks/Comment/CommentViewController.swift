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
    
    func setupView() {
        navigationItem.title = CommentViewController.statusBarTitle
    }
    
}

extension CommentViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        let textView: SimpleTextView = commentView.commentTextView
        if textView.textColor == UIColor.lightGray {
            textView.setText(text: "")
            textView.textColor = UIColor.black
            
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        let textView: SimpleTextView = commentView.commentTextView
        if textView.text.isEmpty {
            textView.setPlaceholder(text: SimpleTextView.defaultPlaceholder)
            textView.textColor = UIColor.lightGray
        }
    }
    
}
