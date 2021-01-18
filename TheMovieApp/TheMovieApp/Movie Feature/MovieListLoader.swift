//
//  MovieListLoader.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 18-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation

public protocol MovieListLoader {
    typealias Result = Swift.Result<[Movie], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
