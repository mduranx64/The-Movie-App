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
    
    func test_load_requestsDataFromURLTwice() {
        let url = URL(string: "https://test-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load { _ in }
        sut.load { _ in }
        
        XCTAssertEqual(client.requestedURLs, [url, url])
    }
    
    func test_returnErrorOnClientError() {
        let (sut, client) = makeSUT()
        let clientError = NSError(domain: "Test", code: 0)
        let exp = expectation(description: "wait for load completion")
        
        sut.load { result in
            switch result {
            case let .failure(receivedError as RemoteMovieListLoader.MovieError):
                XCTAssertEqual(receivedError, RemoteMovieListLoader.MovieError.connectivity)
            default:
                XCTFail()
            }
            
            exp.fulfill()
        }
        
        client.complete(with: clientError)
        wait(for: [exp], timeout: 1.0)
    }
    
    func test_deliversMovieModelsOnResponseWithJSON() {
        let (sut, client) = makeSUT()
        let exp = expectation(description: "wait for load completion")

        let expectedMovie = Movie(voteCount: 0, id: 0, video: false, voteAverage: 0.0, title: "IT", popularity: 0.0, posterPath: "/any", originalLanguage: "en", originalTitle: "IT", genreIDS: [0], backdropPath: "/any", adult: false, overview: "any", releaseDate: Date("2020-12-16"))
        
        let jsonData = JSONHelper.loadData(withFile: "MovieList", inBundle: Bundle(for: type(of: self)))!
        
        sut.load { result in
            switch result {
            case let .success(movies):
                XCTAssertEqual(movies, [expectedMovie])
            default:
                XCTFail()
            }
            
            exp.fulfill()
        }
        
        client.complete(with: jsonData)
        wait(for: [exp], timeout: 1.0)
        
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
    
    private var messages = [(url: URL, completion: (Result<(Data, HTTPURLResponse), Error>) -> Void)]()
    
        
    var requestedURLs: [URL] {
        return messages.map { $0.url }
    }
    
    func get(from url: URL, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) -> HTTPClientTask {
        messages.append((url, completion))
        return Task()
    }
    
    func complete(with error: Error, at index: Int = 0) {
        messages[index].completion(.failure(error))
    }
    
    func complete(with data: Data, at index: Int = 0) {
        let response = HTTPURLResponse(
            url: requestedURLs[index],
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )!
        messages[index].completion(.success((data, response)))
    }
}

extension Date {
    init(_ dateString: String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.calendar = Calendar(identifier: .iso8601)
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateStringFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval: 0, since:date)
    }
}
