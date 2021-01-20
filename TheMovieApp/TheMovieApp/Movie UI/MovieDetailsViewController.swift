//
//  MovieDetailsViewController.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 20-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation
import UIKit

public class MovieDetailsViewController: UIViewController {
    private let movie: Movie
    private let posterImage: UIImage?
    
    private let movieDetailsView = MovieDetailsView()
    
    public init(movie: Movie, posterImage: UIImage?) {
        self.movie = movie
        self.posterImage = posterImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view = movieDetailsView
        movieDetailsView.viewModel = .init(movie: movie, image: posterImage)
    }
}

extension MovieDetailsView.ViewModel {
    init(movie: Movie, image: UIImage?) {
        title = movie.title
        overview = movie.overview
        posterImage = image
    }
}
