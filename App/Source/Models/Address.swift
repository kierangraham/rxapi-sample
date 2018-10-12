//
//  Address.swift
//  RxAPI
//
//  Created by Kieran Graham on 12/10/2018.
//  Copyright © 2018 Kieran Graham. All rights reserved.
//

import Foundation

struct Address: Decodable {
  let street: String
  let suite: String
  let city: String
  let zipcode: String
}
