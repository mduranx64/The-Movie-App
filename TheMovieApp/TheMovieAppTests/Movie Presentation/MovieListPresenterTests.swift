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
    
    func test_init_doesNotSendMessagesToView() {
        let (_, view) = makeSUT()
        
        XCTAssertTrue(view.messages.isEmpty)
    }
    
    func test_didFinishMovieListLoading_displayMovies() {
        let (sut, view) = makeSUT()
        let movie = makeMovie()
        
        sut.didFinishMovieListLoading(with: [movie])
        
        XCTAssertEqual(view.messages, [.display(movies: [movie])])
    }

    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: MovieListPresenter, view: ViewSpy) {
        let view = ViewSpy()
        let sut = MovieListPresenter(movieListView: view)
        trackForMemoryLeaks(view, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, view)
    }
    
    private class ViewSpy: MovieListView {
        enum Message: Hashable {
            case display(movies: [Movie])
        }
        
        private(set) var messages = Set<Message>()

        func display(_ viewModel: MovieListViewModel) {
            messages.insert(.display(movies: viewModel.movies))
        }
    }
}
