//
//  MovieListDataSourceTests.swift
//  TheMovieAppTests
//
//  Created by Miguel Duran on 19-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation
import TheMovieApp
import XCTest

class MovieListDataSourceTests: XCTestCase {
    
    func test_update_setMoviesMatchCount() {
        let dataSource = MovieListDataSource()
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
        collectionView.dataSource = dataSource
        let movies = [makeMovie(id: 0), makeMovie(id: 1)]
        
        dataSource.update(movies)
        
        XCTAssertEqual(movies.count, dataSource.collectionView(collectionView, numberOfItemsInSection: 0))
    }
    
    private func makeSUT() -> MovieListDataSource {
        let dataSource = MovieListDataSource()
        return dataSource
    }
    
    private func makeMovie(id: Int = 0) -> Movie {
        return Movie(voteCount: 0, id: id, video: false, voteAverage: 0.0, title: "IT", popularity: 0.0, posterPath: "/any", originalLanguage: "en", originalTitle: "IT", genreIDS: [0], backdropPath: "/any", adult: false, overview: "any", releaseDate: Date("2020-12-16"))
    }
}
