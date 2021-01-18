//
//  RemoteMovieListLoader.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 18-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation

public final class RemoteMovieListLoader: MovieListLoader {
    
    private let url: URL
    private let client: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
    }
}

