//
//  RentalsViewModel.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 22/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift
import WolmoCore
import Result

class RentalsViewModel {
    
    private let mutableBookSuggestions = MutableProperty<[Book]>([])
    public let bookSuggestions : Property<[Book]>
    
    private let bookRepository: WBookRepositoryType
    
    init(bookRepository: WBookRepositoryType = NetworkingBootstrapper.shared.createWBooksRepository()) {
        self.bookRepository = bookRepository
        
        // TODO: Cambiar este libro por el ultimo libro alquilado
        let book = Book(id: 20, author: "", title: "", imageURL: nil, year: "", genre: "")
        
        bookSuggestions = Property(mutableBookSuggestions)
        mutableBookSuggestions <~ bookRepository.fetchBookSuggestions(book: book)
            .flatMapError { _ in SignalProducer<[Book], NoError>.empty }
        
    }
    
    
    func createRentalsViewModel() -> RentalsViewModel {
        return RentalsViewModel()
    }

}

