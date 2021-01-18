//
//  Genre.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 18-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation

public struct Genre: Decodable {
    
    public let id: Int
    public let name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

public struct GenreList: Decodable {
    
    public let genres: [Genre]
    
    public init(genres: [Genre]) {
        self.genres = genres
    }
}
