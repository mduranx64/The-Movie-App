//
//  SharedTestHelpers.swift
//  TheMovieAppTests
//
//  Created by Miguel Duran on 20-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation
import TheMovieApp

func makeMovie(id: Int = 0) -> Movie {
    return Movie(voteCount: 0, id: id, video: false, voteAverage: 0.0, title: "IT", popularity: 0.0, posterPath: "/any", originalLanguage: "en", originalTitle: "IT", genreIDS: [0], backdropPath: "/any", adult: false, overview: "any", releaseDate: Date("2020-12-16"))
}
