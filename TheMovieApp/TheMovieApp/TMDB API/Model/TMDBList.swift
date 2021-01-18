//
//  TMDBList.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 18-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation

struct TMDBList<T: Decodable> {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [T]
}

extension TMDBList: Decodable {
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
