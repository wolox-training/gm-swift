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
    func fetchRents(user: User) -> SignalProducer<[Rent], RepositoryError>
    
}

class WBookRepository: AbstractRepository, WBookRepositoryType {
    
    private static let EntitiesPath = "books"
    private static let CommentsPath = "books/$book_id/comments"
    private static let UserRentsPath = "/users/$user_id/rents"
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
    
    public func fetchRents(user: User) -> SignalProducer<[Rent], RepositoryError> {
        let path = WBookRepository.UserRentsPath.replacingOccurrences(of: "$user_id", with: String(user.id))
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
