//
//  JSONDecodingTests.swift
//  RxAPITests
//
//  Created by Kieran Graham on 12/10/2018.
//  Copyright © 2018 Kieran Graham. All rights reserved.
//

import XCTest
@testable import RxAPI

import Nimble

class JSONDecodingTests: XCTestCase {
  func testUserDecoding() {

  }

  func testPostDecoding() {

  }

  private func load(fixture: String) -> Data {
    let bundle = Bundle(for: type(of: self))
    let path = bundle.url(forResource: fixture, withExtension: "json")!
    
    return try! Data(contentsOf: path)
  }
}
