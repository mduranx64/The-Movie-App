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
        let (sut, collectionView) = makeSUT()
        let movies = [makeMovie(id: 0), makeMovie(id: 1)]
        
        sut.update(movies)
        
        XCTAssertEqual(movies.count, sut.collectionView(collectionView, numberOfItemsInSection: 0))
    }
    
    func test_item_returnCorrectItemByIndex() {
        let (sut, _) = makeSUT()
        let movies = [makeMovie(id: 0), makeMovie(id: 1)]
        
        sut.update(movies)
        let expectedItem = sut.item(at: 1)
        
        XCTAssertEqual(movies[1], expectedItem)

    }
    
    func test_collectionView_cellForItemAtIndexPath() {
        let (sut, collection) = makeSUT()
        let movie = makeMovie()
        sut.update([movie])
        
        let cell = sut.collectionView(collection, cellForItemAt: IndexPath(row: 0, section: 0)) as? MovieCell
        
        XCTAssertEqual(cell?.titleLabel.text, movie.originalTitle)
        
    }
    
    private func makeSUT() -> (sut: MovieListDataSource, collection: UICollectionView) {
        let dataSource = MovieListDataSource()
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
        collectionView.dataSource = dataSource
        collectionView.registerCell(withClass: MovieCell.self)
        return (dataSource, collectionView)
    }
}
