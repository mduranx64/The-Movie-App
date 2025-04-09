//
//  AppDelegate.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 17-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var httpClient: HTTPClient = {
        URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        configureWindow()
        
        return true
    }

    func configureWindow() {
        let url = URL(string: TMDBURLs.moviesURLString)!
        
        let remoteMovieListLoader = RemoteMovieListLoader(url: url, client: httpClient)
        let remoteImageDataLoader = RemoteImageDataLoader(client: httpClient)
        let movieListViewController = MovieListUIComposer.movieListComposeWith(movieListLoader: remoteMovieListLoader, remoteImageDataLoader: remoteImageDataLoader)
        let navigationController = UINavigationController(rootViewController: movieListViewController)
        
        movieListViewController.detailsViewNavigation = { movie, image in
            let movieDetailsViewController = MovieDetailsViewController(movie: movie, posterImage: image)
            navigationController.pushViewController(movieDetailsViewController, animated: true)
        }
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}
