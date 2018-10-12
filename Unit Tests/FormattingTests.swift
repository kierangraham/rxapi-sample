//
//  FormattingTests.swift
//  RxAPI
//
//  Created by Kieran Graham on 12/10/2018.
//  Copyright © 2018 Kieran Graham. All rights reserved.
//

import XCTest
@testable import RxAPI

import Nimble

class FormattingTests: XCTestCase {
  func testFormattedUserAddress() {
    let json = load(fixture: "user")
    let sut = try! JSONDecoder().decode(User.self, from: json)

    expect(sut.formattedAddress).to(equal("Kattie Turnpike, Suite 198, Lebsackbury, 31428-2261"))
  }
}

