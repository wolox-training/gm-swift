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
    
}

class WBookRepository: AbstractRepository, WBookRepositoryType {
    
    private static let EntitiesPath = "books"
    private static let CommentsPath = "books/$book_id/comments"
    
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
    
}
