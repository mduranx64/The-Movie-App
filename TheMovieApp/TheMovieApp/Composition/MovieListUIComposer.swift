//
//  MovieListUIComposer.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 19-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation

public final class MovieListUIComposer {
    private init (){}
    
    public static func movieListComposeWith(movieListLoader: MovieListLoader, remoteImageDataLoader: ImageDataLoader) -> MovieListViewController {
        let presentationAdapter = MovieListLoaderPresentationAdapter(movieListLoader: movieListLoader, imageDataLoader: remoteImageDataLoader)
        let movieListViewController = MovieListViewController(
            dataSource: MovieListDataSource(),
            delegate: presentationAdapter)
        
        movieListViewController.title = MovieListPresenter.title
        
        presentationAdapter.presenter = MovieListPresenter(movieListView: movieListViewController)
        
        return movieListViewController
    }
}
