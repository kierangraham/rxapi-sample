//
//  APIClientTests.swift
//  RxAPITests
//
//  Created by Kieran Graham on 12/10/2018.
//  Copyright © 2018 Kieran Graham. All rights reserved.
//

import XCTest
@testable import RxAPI

import Nimble
import RxBlocking

class APIClientTests: XCTestCase {
  func testUsersEndpoint() {
    let sut = Endpoint.users

    expect(sut.method).to(equal(.get))
    expect(sut.url).to(equal(URL(string: "https://jsonplaceholder.typicode.com")!))
    expect(sut.path).to(equal("/users"))
    expect(sut.parameters).to(beNil())

    let client = APIClient()
    let response = try! client.users().toBlocking().toArray()[0]

    expect(response.count).to(beGreaterThan(0))
  }

  func testPostsEndpoint() {
    let user = User(
      id: 1,
      name: "Test",
      username: "test.username",
      email: "test@test.com",
      address: Address(
        street: "Teststraße 99",
        suite: "5A",
        city: "Berlin",
        zipcode: "10115"
      )
    )

    let sut = Endpoint.posts(user: user)

    expect(sut.method).to(equal(.get))
    expect(sut.url).to(equal(URL(string: "https://jsonplaceholder.typicode.com")!))
    expect(sut.path).to(equal("/posts"))
    expect(sut.parameters).to(equal(["userId": "1"]))

    let client = APIClient()
    let response = try! client.posts(for: user).toBlocking().toArray()[0]

    expect(response.count).to(beGreaterThan(0))
  }
}
