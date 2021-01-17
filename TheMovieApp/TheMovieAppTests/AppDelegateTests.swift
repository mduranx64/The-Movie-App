//
//  AppDelegateTests.swift
//  TheMovieAppTests
//
//  Created by Miguel Duran on 17-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import XCTest
@testable import TheMovieApp

class AppDelegateTests: XCTestCase {

    func test_configureWindow_setsWindowAsKeyAndVisible() {
        let window = UIWindow()
        let sut = AppDelegate()
        sut.window = window
        
        sut.configureWindow()
        
        XCTAssertTrue(window.isKeyWindow, "Expected window to be the key window")
        XCTAssertFalse(window.isHidden, "Expected window to be visible")
    }
    
    func test_configureWindow_configureRootViewController() {
        let sut = AppDelegate()
        sut.window = UIWindow()
        
        sut.configureWindow()
        
        let root = sut.window?.rootViewController
        let navigationController = root as? UINavigationController
        let topController = navigationController?.topViewController
        
        XCTAssertNotNil(navigationController, "Expected navigation controller as root, got \(String(describing: root)) instead")
        XCTAssertTrue(topController is MovieListViewController, "Expected MovieListViewController as top view controller, got \(String(describing: topController)) instead")
    }

}
