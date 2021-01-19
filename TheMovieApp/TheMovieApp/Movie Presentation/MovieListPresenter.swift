//
//  MovieListPresenter.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 19-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation

public protocol MovieListView {
    func display(_ viewModel: MovieListViewModel)
}

public final class MovieListPresenter {
    private let movieListView: MovieListView
    
    public init(movieListView: MovieListView) {
        self.movieListView = movieListView
    }
    
    public func didFinishMovieListLoading(with movies: [Movie]) {
        movieListView.display(MovieListViewModel(movies: movies))
    }
}
