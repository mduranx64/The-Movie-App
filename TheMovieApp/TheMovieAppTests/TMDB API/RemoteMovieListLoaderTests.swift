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
        
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    func test_load_requestedDataFromURL() {
        let url = URL(string: "https://test-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load { _ in }
        
        XCTAssertEqual(client.requestedURLs, [url])
    }
    
    private func makeSUT(url: URL = URL(string: "https://any-url.com")!) -> (sut: RemoteMovieListLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteMovieListLoader(url: url, client: client)
        return (sut, client)
    }
}

class HTTPClientSpy: HTTPClient {
    private struct Task: HTTPClientTask {
        func cancel() {
            
        }
    }
        
    var requestedURLs = [URL]()
    
    func get(from url: URL, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) -> HTTPClientTask {
        requestedURLs.append(url)
        return Task()
    }
}
