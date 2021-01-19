//
//  MovieListLoaderPresentacionAdapter.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 19-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation

final class MovieListLoaderPresentacionAdapter: MovieListViewControllerDelegate {
    private let movieListLoader: MovieListLoader
    var presenter: MovieListPresenter?
    
    init(movieListLoader: MovieListLoader) {
        self.movieListLoader = movieListLoader
    }
    
    func didRequestMovieList() {
        movieListLoader.load { [weak self] result in
            switch result {
            case let .success(movies):
                DispatchQueue.main.async {
                    self?.presenter?.didFinishMovieListLoading(with: movies)
                }
            case .failure(_):
                break
            }
        }
    }
}
