//
//  XCTestCase+Helpers.swift
//  RxAPITests
//
//  Created by Kieran Graham on 12/10/2018.
//  Copyright © 2018 Kieran Graham. All rights reserved.
//

import XCTest

extension XCTestCase {
  /// Loads a JSON fixture from the filesystem to use in test cases
  func load(fixture: String) -> Data {
    let bundle = Bundle(for: type(of: self))
    let path = bundle.url(forResource: fixture, withExtension: "json")!

    return try! Data(contentsOf: path)
  }
}
