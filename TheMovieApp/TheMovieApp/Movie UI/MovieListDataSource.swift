//
//  MovieListDataSource.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 19-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation
import UIKit

public class MovieListDataSource: NSObject, UICollectionViewDataSource {
    
    private var movies = [Movie]()
    
    public func update(_ movies: [Movie]) {
        self.movies.append(contentsOf: movies)
    }
    
    public func item(at index: Int) -> Movie {
        return self.movies[index]
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCell = collectionView.dequeueReusableCell(at: indexPath)
        let movie = movies[indexPath.row]
        cell.titleLabel.text = movie.originalTitle
        return cell
    }
}
