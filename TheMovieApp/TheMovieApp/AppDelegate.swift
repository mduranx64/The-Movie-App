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
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key={YOUR_API_KEY_HERE}&page=1")!
        
        let remoteMovieListLoader = RemoteMovieListLoader(url: url, client: httpClient)
        let remoteImageDataLoader = RemoteImageDataLoader(client: httpClient)
        let movieListViewController = MovieListUIComposer.movieListComposeWith(movieListLoader: remoteMovieListLoader, remoteImageDataLoader: remoteImageDataLoader)
        let navigationController = UINavigationController(rootViewController: movieListViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}
