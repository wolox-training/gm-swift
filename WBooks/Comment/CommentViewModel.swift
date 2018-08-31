//
//  CommentViewModel.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 30/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

class CommentViewModel {
    
    public let book: Book
    private let bookRepository: WBookRepositoryType
    
    init(book: Book, bookRepository: WBookRepositoryType = NetworkingBootstrapper.shared.createWBooksRepository()) {
        self.book = book
        self.bookRepository = bookRepository
    }
}
