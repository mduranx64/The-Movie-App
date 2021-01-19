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
    
    public enum MovieError: Error {
        case connectivity
        case invalidData
    }
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Result<[Movie], Error>) -> Void) {
        client.get(from: url) { result in
            switch result {
            case let .success((data, response)):
                completion(RemoteMovieListLoader.map(data, from: response))
            case .failure:
                completion(.failure(MovieError.connectivity))
            }
        }
    }
    
    private static func map(_ data: Data, from response: HTTPURLResponse) -> Result<[Movie], Error> {
        do {
            let items = try MovieMapper.map(data, from: response)
            return .success(items.toModels())
        } catch {
            return .failure(error)
        }
    }
}

private extension Array where Element == TMDBMovie {
    func toModels() -> [Movie] {
        return map {
            Movie(voteCount: $0.voteCount,
                  id: $0.id,
                  video: $0.video,
                  voteAverage: $0.voteAverage,
                  title: $0.title,
                  popularity: $0.popularity,
                  posterPath: $0.posterPath,
                  originalLanguage: $0.originalLanguage,
                  originalTitle: $0.originalTitle,
                  genreIDS: $0.genreIDS,
                  backdropPath: $0.backdropPath,
                  adult: $0.adult,
                  overview: $0.overview,
                  releaseDate: $0.releaseDate)
        }
    }
}



