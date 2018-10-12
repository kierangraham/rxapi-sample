//
//  Post.swift
//  RxAPI
//
//  Created by Kieran Graham on 12/10/2018.
//  Copyright © 2018 Kieran Graham. All rights reserved.
//

import Foundation

struct Post: Decodable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}
