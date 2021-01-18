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
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
     
    @discardableResult
    func get(from url: URL, completion: @escaping (Result) -> Void) -> HTTPClientTask
}
