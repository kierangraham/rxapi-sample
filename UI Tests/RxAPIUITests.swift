//
//  RxAPIUITests.swift
//  RxAPIUITests
//
//  Created by Kieran Graham on 11/10/2018.
//  Copyright © 2018 Kieran Graham. All rights reserved.
//

import XCTest

class RxAPIUITests: XCTestCase {
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    XCUIApplication().launch()

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }

  func testUsersScreen() {
    let app = XCUIApplication()
    XCTAssertTrue(app.tables.cells.count > 0)
  }

  func testPostsScreen() {
    let app = XCUIApplication()
    XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["Sincere@april.biz"]/*[[".cells.staticTexts[\"Sincere@april.biz\"]",".staticTexts[\"Sincere@april.biz\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    XCTAssertTrue(app.tables.cells.count > 0)
  }
}
