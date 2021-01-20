//
//  TheMovieAppUITests.swift
//  TheMovieAppUITests
//
//  Created by Miguel Duran on 17-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import XCTest

class TheMovieAppUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        
        XCUIApplication().launch()
    }
    
    func test_navigationToDetailsMovieView() {
 
        let app = XCUIApplication()
        app.collectionViews.children(matching: .any).element(boundBy: 0).tap()
        app.navigationBars["The Movie App"].buttons["The Movie App"].tap()
  
        let cell = app.collectionViews.children(matching: .any).element(boundBy: 0)
        XCTAssertTrue(cell.exists)
    }

}
