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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        configureWindow()
        
        return true
    }

    func configureWindow() {
        let movieListViewController = MovieListViewController(dataSource: MovieListDataSource(), delegate: MovieListLoaderPresentacionAdapter())
        let navigationController = UINavigationController(rootViewController: movieListViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}
