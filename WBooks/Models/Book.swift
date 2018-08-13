//
//  Book.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 13/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation

struct Book {
    
    //MARK: Properties
    let id: Int
    let author: String
    let title: String
    let image: [String: String]
    let publisher: String
    let year: String
    let genre: String
    let createdAt: Date
    let updatedAt: Date
    
    
    init(id: Int, author: String, title: String,
         image: [String: String], publisher: String, year: String,
         genre: String, createdAt: Date, updatedAt: Date) {
        
        self.id = id
        self.author = author
        self.title = title
        self.image = image
        self.publisher = publisher
        self.year = year
        self.genre = genre
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    
    func getImageUrl() -> String? {
        return image["url"]
    }
}
