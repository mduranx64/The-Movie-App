//
//  MovieMapper.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 18-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation

final class MovieMapper {
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [TMDBMovie] {
        guard response.statusCode == 200, let list = try?
            JSONDecoder().decode(TMDBList<TMDBMovie>.self, from: data) else {
                throw RemoteMovieListLoader.MovieError.invalidData
        }
        
        return list.results
    }
}
