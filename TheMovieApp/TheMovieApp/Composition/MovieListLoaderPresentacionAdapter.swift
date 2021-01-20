//
//  MovieListLoaderPresentacionAdapter.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 19-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation
import UIKit

final class MovieListLoaderPresentacionAdapter: MovieListViewControllerDelegate {
  
    private let movieListLoader: MovieListLoader
    private let imageDataLoader: ImageDataLoader

    var presenter: MovieListPresenter?
    
    init(movieListLoader: MovieListLoader, imageDataLoader: ImageDataLoader) {
        self.movieListLoader = movieListLoader
        self.imageDataLoader = imageDataLoader
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
    
    func didRequestMovieImage(imagePath: String, completion: @escaping (UIImage?) -> Void) {
        let imageRootURL = URL(string: "https://image.tmdb.org/t/p/w154")!
        let urlWithPath = imageRootURL.appendingPathComponent(imagePath)
        _ = imageDataLoader.loadImageData(from: urlWithPath) { [weak self] result in
            guard self != nil else { return }
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    let image = UIImage(data: data)
                    completion(image)
                case .failure:
                    completion(nil)
                }
            }
        }
    }
}
