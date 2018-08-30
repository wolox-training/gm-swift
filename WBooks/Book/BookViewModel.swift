//
//  BookViewModel.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 15/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift
import WolmoCore
import Result

class BookViewModel {
    
    public let book: Book
    private let bookRepository: WBookRepositoryType
    private let mutableComments = MutableProperty<[Comment]>([])
    public let comments : Property<[Comment]>
    private let mutableBookSuggestions = MutableProperty<[Book]>([])
    public let bookSuggestions : Property<[Book]>

    
    init(book: Book, bookRepository: WBookRepositoryType = NetworkingBootstrapper.shared.createWBooksRepository()) {
        self.book = book
        self.bookRepository = bookRepository
        
        comments = Property(mutableComments)
        mutableComments <~ bookRepository.fetchComments(book: book)
            .flatMapError { _ in SignalProducer<[Comment], NoError>.empty }
        
        
        bookSuggestions = Property(mutableBookSuggestions)
        mutableBookSuggestions <~ bookRepository.fetchBookSuggestions(book: book)
            .flatMapError { _ in SignalProducer<[Book], NoError>.empty }
        
    }
    
    func createCommentViewModel(book: Book) -> CommentViewModel {
        return CommentViewModel(book: book)
    }
    
}
