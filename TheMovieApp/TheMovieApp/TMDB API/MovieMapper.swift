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
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMdd)

        guard response.statusCode == 200, let list = try?
            decoder.decode(TMDBList<TMDBMovie>.self, from: data) else {
                throw RemoteMovieListLoader.MovieError.invalidData
        }
        
        return list.results
    }
}

extension DateFormatter {
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
