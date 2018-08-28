//
//  Rent.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 23/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Argo
import Runes
import Curry

struct Rent {
    
    let id: Int
    let book: Book
    
    init(id: Int, book: Book) {
        self.id = id
        self.book = book
    }
}

extension Rent: Argo.Decodable {
    
    static func decode(_ json: JSON) -> Decoded<Rent> {
        return curry(Rent.init)
            <^> json <| "id"
            <*> json <| "book"
    }
    
}

