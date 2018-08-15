//
//  BookViewController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 15/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import WolmoCore

class BookViewController: UIViewController {
    
    private let bookView: BookView = BookView.loadFromNib()!
    public var book = MutableProperty<Book?>(.none)
    private static let imagePlaceholder = "image_placeholder"
    
    override func loadView() {
        view = bookView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
}

//MARK: - Private
private extension BookViewController {
    
    func setupBindings() {
        book.producer.startWithValues({ [unowned self] book in
            self.setupView(bookItem: book!)
        })
    }
    
}

private extension BookViewController {
    
    func setupView(bookItem: Book) {
        bookView.bookPhoto.image = UIImage(named: BookViewController.imagePlaceholder)
        
        if let url = bookItem.imageURL {
            bookView.bookPhoto.load(url: url)
        }
        
        bookView.bookTitle.text = bookItem.title
        bookView.bookAuthor.text = bookItem.author
        bookView.bookGenre.text = bookItem.genre
        bookView.bookYear.text = bookItem.year
    }
    
}
