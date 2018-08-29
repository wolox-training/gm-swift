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
    
    private let book: Book
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
        
        
        // TODO: Cambiar este libro por el ultimo libro alquilado
        let book = Book(id: 20, author: "", title: "", imageURL: nil, year: "", genre: "")
        
        bookSuggestions = Property(mutableBookSuggestions)
        mutableBookSuggestions <~ bookRepository.fetchBookSuggestions(book: book)
            .flatMapError { _ in SignalProducer<[Book], NoError>.empty }
        
    }
    
    
    /*
    func getComments() -> [Comment] {
        var comments: [Comment] = []
        
        let imageUrl = "https://vignette.wikia.nocookie.net/lotr/images/4/45/Cover_lotr_green_gandalf.jpg/revision/latest?cb=20070102112551" // LOTR image
        
        for i in 0..<5 {
            let user = User(id: 0, firstName: "Martin", lastName: "Hernandez", imageURL: imageUrl)
            comments.append(Comment(id: i, content: "Test comment", user: user))
        }
        
        return comments
    }
     */
}
