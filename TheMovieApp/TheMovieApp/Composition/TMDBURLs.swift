//
//  TMDBURLs.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 20-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation

enum TMDBURLs {
    static var moviesURLString: String {
        if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path),
           let apiKey = dict["TMDB_API_KEY"] as? String {
            return "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&page=1"
        }
        return ""
    }
    
    static let imagesURLString = "https://image.tmdb.org/t/p/w154"
}
