//
//  Movie.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 18-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation

public struct Movie {
    
    public let voteCount, id: Int
    public let video: Bool
    public let voteAverage: Float
    public let title: String
    public let popularity: Float
    public let posterPath: String?
    public let originalLanguage: String
    public let originalTitle: String
    public let genreIDS: [Int]
    public let backdropPath: String?
    public let adult: Bool
    public let overview: String
    public let releaseDate: Date
    public var isFavorite = false
    
    public init(voteCount: Int, id: Int, video: Bool, voteAverage: Float, title: String, popularity: Float, posterPath: String?, originalLanguage: String, originalTitle: String, genreIDS: [Int], backdropPath: String?, adult: Bool, overview: String, releaseDate: Date, isFavorite: Bool = false) {
        self.voteCount = voteCount
        self.id = id
        self.video = video
        self.voteAverage = voteAverage
        self.title = title
        self.popularity = popularity
        self.posterPath = posterPath
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.genreIDS = genreIDS
        self.backdropPath = backdropPath
        self.adult = adult
        self.overview = overview
        self.releaseDate = releaseDate
        self.isFavorite = isFavorite
    }
}
