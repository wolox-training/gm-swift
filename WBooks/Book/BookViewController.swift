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
            self.setupView(book: book!)
        })
    }
    
}

private extension BookViewController {
    
    func setupView(book: Book) {
        bookView.bookPhoto.image = UIImage(named: BookViewController.imagePlaceholder)
        
        if let url = book.imageURL {
            bookView.bookPhoto.load(url: url)
        }
        
        bookView.bookTitle.text = book.title
        bookView.bookAuthor.text = book.author
        bookView.bookGenre.text = book.genre
        bookView.bookYear.text = book.year
    }
    
}
