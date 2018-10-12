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
    let json = load(fixture: "user")
    let sut = try! JSONDecoder().decode(User.self, from: json)

    expect(sut.id).to(equal(10))
    expect(sut.name).to(equal("Clementina DuBuque"))
    expect(sut.email).to(equal("Rey.Padberg@karina.biz"))
    expect(sut.username).to(equal("Moriah.Stanton"))

    expect(sut.address.street).to(equal("Kattie Turnpike"))
    expect(sut.address.suite).to(equal("Suite 198"))
    expect(sut.address.city).to(equal("Lebsackbury"))
    expect(sut.address.zipcode).to(equal("31428-2261"))
  }

  func testPostDecoding() {
    let json = load(fixture: "post")
    let sut = try! JSONDecoder().decode(Post.self, from: json)

    expect(sut.id).to(equal(94))
    expect(sut.userId).to(equal(10))
    expect(sut.title).to(equal("post title"))
    expect(sut.body).to(equal("and then some body copy"))
  }
}
