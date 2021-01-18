//
//  TMDBGenre.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 18-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation

struct TMDBGenre: Decodable {
    let id: Int
    let name: String
}

struct TMDBGenreList: Decodable {
    let genres: [TMDBGenre]
}
