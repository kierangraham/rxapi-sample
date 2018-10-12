//
//  User.swift
//  RxAPI
//
//  Created by Kieran Graham on 12/10/2018.
//  Copyright © 2018 Kieran Graham. All rights reserved.
//

import Foundation

struct User: Decodable {
  let id: Int
  let name: String
  let username: String
  let email: String
  let address: Address

  var formattedAddress: String {
    return [
      address.street, address.suite,
      address.city, address.zipcode
    ]
    .filter { !$0.isEmpty }
    .joined(separator: ", ")
  }
}
