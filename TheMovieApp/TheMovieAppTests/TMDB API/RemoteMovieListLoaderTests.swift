//
//  RemoteMovieListLoaderTests.swift
//  TheMovieAppTests
//
//  Created by Miguel Duran on 18-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//
import XCTest
import TheMovieApp

class RemoteMovieListLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()
        
        XCTAssertNil(client.requestedURLs)
    }
    
    private func makeSUT() -> (sut: RemoteMovieListLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteMovieListLoader(url: URL(string: "https://a-url.com")!, client: client)
        return (sut, client)
    }
}

class HTTPClientSpy: HTTPClient {
    private struct Task: HTTPClientTask {
        func cancel() {
            
        }
    }
    
    var requestedURLs: URL?
    
    func get(from url: URL, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) -> HTTPClientTask {
        Task()
    }
}
