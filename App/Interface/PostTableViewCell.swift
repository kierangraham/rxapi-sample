//
//  PostTableViewCell.swift
//  RxAPI
//
//  Created by Kieran Graham on 12/10/2018.
//  Copyright © 2018 Kieran Graham. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
  static var ID: String {
    return "PostTableViewCell"
  }

  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var bodyLabel: UILabel!

  func configure(post: Post) {
    self.titleLabel.text = post.title
    self.bodyLabel.text = post.body
  }
}
