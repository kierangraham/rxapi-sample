//
//  User.swift
//  RxAPI
//
//  Created by Kieran Graham on 12/10/2018.
//  Copyright © 2018 Kieran Graham. All rights reserved.
//

import Foundation

struct User: Codable {
  let id: Int
  let name: String
  let email: String
  let address: Address
}
