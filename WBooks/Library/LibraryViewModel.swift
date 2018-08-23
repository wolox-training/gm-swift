//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 13/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift
import WolmoCore
import Result

class LibraryViewModel {
    
    private let mutableBooks = MutableProperty<[Book]>([])
    public let books : Property<[Book]>
    
    private var page = 0
    private static let amountPerPage = 30
    
    private let bookRepository: WBookRepositoryType
    
    init(bookRepository: WBookRepositoryType = NetworkingBootstrapper.shared.createWBooksRepository()) {
        self.bookRepository = bookRepository
        
        books = Property(mutableBooks)
        mutableBooks <~ bookRepository.fetchEntities(page: 0, amount: LibraryViewModel.amountPerPage)
            .flatMapError { _ in SignalProducer<[Book], NoError>.empty }
        
    }
    
    func fetchMoreBooks() {
        page += 1
        let signalProducer: SignalProducer<[Book], NoError> = bookRepository.fetchEntities(page: page, amount: LibraryViewModel.amountPerPage)
            .flatMapError { _ in SignalProducer<[Book], NoError>.empty }
        
        signalProducer.startWithValues { [unowned self] loadedBooks: [Book] in
            self.mutableBooks.value.append(loadedBooks)
        }
        
    }
    
    func createBookViewModel(book: Book) -> BookViewModel {
        return BookViewModel(book: book)
    }
    
}
