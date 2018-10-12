//
//  UserTableViewCell.swift
//  RxAPI
//
//  Created by Kieran Graham on 12/10/2018.
//  Copyright © 2018 Kieran Graham. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
  static var ID: String {
    return "UserTableViewCell"
  }
  
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var usernameLabel: UILabel!
  @IBOutlet var emailLabel: UILabel!
  @IBOutlet var addressLabel: UILabel!

  func configure(user: User) {
    self.nameLabel.text = user.name
    self.usernameLabel.text = "@\(user.username)"
    self.emailLabel.text = user.email
    self.addressLabel.text = user.formattedAddress
  }
}
