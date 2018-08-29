//
//  Comment.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 16/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Argo
import Runes
import Curry


struct Comment {
    
    // MARK: - Properties
    let id: Int
    let content: String
    let user: User
    
    
    init(id: Int, content: String, user: User) {
        self.id = id
        self.content = content
        self.user = user
    }
}


extension Comment: Argo.Decodable {
    
    static func decode(_ json: JSON) -> Decoded<Comment> {
        return curry(Comment.init)
            <^> json <| "id"
            <*> json <| "content"
            <*> json <| "user"
    }
    
}
