//
//  HTTPClient.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 18-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation

public protocol HTTPClientTask {
    func cancel()
}

public protocol HTTPClient {
     
    @discardableResult
    func get(from url: URL, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) -> HTTPClientTask
}
