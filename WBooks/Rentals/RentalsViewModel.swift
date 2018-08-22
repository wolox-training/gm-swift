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
    
    //private let mutableBooks = MutableProperty<[Book]>([])
    //public let books : Property<[Book]>
    
    private let bookRepository: WBookRepositoryType
    
    init(bookRepository: WBookRepositoryType = NetworkingBootstrapper.shared.createWBooksRepository()) {
        self.bookRepository = bookRepository
        
        //books = Property(mutableBooks)
        //mutableBooks <~ bookRepository.fetchRentals()
        //    .flatMapError { _ in SignalProducer<[Book], NoError>.empty }
        
    }
    
    
    func createRentalsViewModel() -> RentalsViewModel {
        return RentalsViewModel()
    }

}

