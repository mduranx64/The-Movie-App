//
//  MovieListPresenterTests.swift
//  TheMovieAppTests
//
//  Created by Miguel Duran on 20-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import XCTest
import TheMovieApp

class MovieListPresenterTests: XCTestCase {

    func test_title_isLocalized() {
        XCTAssertEqual(MovieListPresenter.title, L10n.movieListTitle)
    }

}
