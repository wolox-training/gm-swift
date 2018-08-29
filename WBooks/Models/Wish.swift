//
//  Wish.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 29/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Argo
import Runes
import Curry

struct Wish {
    
    // MARK: Properties
    let book: Book
    let user: User
    
    
    init(book: Book, user: User) {
        self.book = book
        self.user = user
    }
}

extension Wish: Argo.Decodable {
    
    static func decode(_ json: JSON) -> Decoded<Wish> {
        return curry(Wish.init)
            <^> json <| "book"
            <*> json <| "user"
    }
    
}

