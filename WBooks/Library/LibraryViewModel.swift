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
    
    public let books = MutableProperty<[Book]>([])
    
    private let bookRepository: WBookRepositoryType
    
    init(bookRepository: WBookRepositoryType = NetworkingBootstrapper.shared.createWBooksRepository()) {
        self.bookRepository = bookRepository
        
        /*
        bookRepository.fetchEntities().startWithResult { [unowned self] result in
            switch result {
            case .success(let books):
                self.books.value = books

            case .failure(let error):
                print(error)
            }
        }
        */
        
        books <~ bookRepository.fetchEntities()
            //.liftError()
            .flatMapError { _ in SignalProducer<[Book], NoError>.empty }
        
    }
    
    
    /*
    func getBooks() -> [Book] {
        var books: [Book] = []
        
        let year = "2018"
        let imageUrl = "https://vignette.wikia.nocookie.net/lotr/images/4/45/Cover_lotr_green_gandalf.jpg/revision/latest?cb=20070102112551" // LOTR image
        
        for i in 0..<100 {
            books.append(Book(id: i, author: "Author \(i)", title: "Title \(i)",
                    imageURL: imageUrl,
                    year: year, genre: "Genre \(i)"))
        }
        
        return books
    }
    */
}
