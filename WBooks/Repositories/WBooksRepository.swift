//
//  WBooksRepository.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 13/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import ReactiveSwift
import Argo
import Result

protocol WBookRepositoryType {
    
    func fetchEntities() -> SignalProducer<[Book], RepositoryError>
    func fetchComments(book: Book) -> SignalProducer<[Comment], RepositoryError>
    func fetchBookSuggestions(book: Book) -> SignalProducer<[Book], RepositoryError>
    
}

class WBookRepository: AbstractRepository, WBookRepositoryType {
    
    private static let EntitiesPath = "books"
    private static let CommentsPath = "books/$book_id/comments"
    private static let RentalsPath = "books"
    private static let BookSuggestionsPath = "books/$book_id/suggestions"
    
    
    public func fetchEntities() -> SignalProducer<[Book], RepositoryError> {
        let path = WBookRepository.EntitiesPath
        return performRequest(method: .get, path: path) {
            decode($0).toResult()
        }
    }
    
    public func fetchComments(book: Book) -> SignalProducer<[Comment], RepositoryError> {
        let path = WBookRepository.CommentsPath.replacingOccurrences(of: "$book_id", with: String(book.id))
        return performRequest(method: .get, path: path) {
            decode($0).toResult()
        }
    }
    
    public func fetchRentals() -> SignalProducer<[Book], RepositoryError> {
        let path = WBookRepository.RentalsPath
        return performRequest(method: .get, path: path) {
            decode($0).toResult()
        }
    }
    
    public func fetchBookSuggestions(book: Book) -> SignalProducer<[Book], RepositoryError> {
        let path = WBookRepository.BookSuggestionsPath.replacingOccurrences(of: "$book_id", with: String(book.id))
        return performRequest(method: .get, path: path) {
            decode($0).toResult()
        }
    }
}
