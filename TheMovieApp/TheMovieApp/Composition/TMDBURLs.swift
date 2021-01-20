//
//  TMDBURLs.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 20-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation

enum TMDBURLs: String {
    case moviesURLString = "https://api.themoviedb.org/3/movie/popular?api_key={YOUR_API_KEY_HERE}&page=1"
    case imagesURLString = "https://image.tmdb.org/t/p/w154"
}
