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
    private let mutableRents = MutableProperty<[Rent]>([])
    public let rents : Property<[Rent]>
    
    private let bookRepository: WBookRepositoryType
    
    init(bookRepository: WBookRepositoryType = NetworkingBootstrapper.shared.createWBooksRepository()) {
        self.bookRepository = bookRepository
        
        // TODO: Cambiar este libro por el ultimo libro alquilado
        let book = Book(id: 20, author: "", title: "", imageURL: nil, year: "", genre: "")
        
        bookSuggestions = Property(mutableBookSuggestions)
        mutableBookSuggestions <~ bookRepository.fetchBookSuggestions(book: book)
            .flatMapError { _ in SignalProducer<[Book], NoError>.empty }
        
        // TODO: Cambiar este usuario por el actualmente logueado
        let user = User(id: 54, firstName: "", lastName: "", imageURL: nil)
        
        rents = Property(mutableRents)
        mutableRents <~ bookRepository.fetchRents(user: user)
            .flatMapError { _ in SignalProducer<[Rent], NoError>.empty }
    }
    
    
    func createRentedBookViewModel(book: Book) -> RentedBookViewModel {
        return RentedBookViewModel(book: book)
    }

}

