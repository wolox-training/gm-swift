//
//  WishlistViewModel.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 22/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift
import WolmoCore
import Result

class WishlistViewModel {
    
    private let mutableBookSuggestions = MutableProperty<[Book]>([])
    public let bookSuggestions : Property<[Book]>
    private let mutableWishes = MutableProperty<[Wish]>([])
    public let wishes : Property<[Wish]>
    
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
        
        wishes = Property(mutableWishes)
        mutableWishes <~ bookRepository.fetchWishes(user: user)
            .flatMapError { _ in SignalProducer<[Wish], NoError>.empty }
    }
    
}
