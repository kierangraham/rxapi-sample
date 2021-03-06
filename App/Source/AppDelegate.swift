//
//  AppDelegate.swift
//  RxAPI
//
//  Created by Kieran Graham on 11/10/2018.
//  Copyright © 2018 Kieran Graham. All rights reserved.
//

import UIKit

/// Global access to the APIClient for simplicity
let API = APIClient()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    return true
  }

}

