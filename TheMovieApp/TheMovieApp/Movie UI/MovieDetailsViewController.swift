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
    
    public init(movie: Movie, posterImage: UIImage?) {
        self.movie = movie
        self.posterImage = posterImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}