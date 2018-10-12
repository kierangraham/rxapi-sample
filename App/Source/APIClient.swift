//
//  APIClient.swift
//  RxAPI
//
//  Created by Kieran Graham on 12/10/2018.
//  Copyright © 2018 Kieran Graham. All rights reserved.
//

import Foundation
import RxSwift

let API_URL = "https://jsonplaceholder.typicode.com"

// MARK: Endpoint Definitions

/// Available API endpoints are defined along with their associated
/// parameters required to perform a successful call
enum Endpoint {
  case users
  case posts(user: User)
}

extension Endpoint {
  /// Which HTTP method should be used when building a request?
  var method: Method {
    return .get
  }

  /// The base API URL to use for this endpoint
  var url: URL {
    return URL(string: API_URL)!
  }

  /// The path component which should be used for this endpoint
  var path: String {
    switch self {
    case .users:
      return "/users"
    case .posts(let user):
      return "/posts"
    }
  }

  /// Parameters used to send the request
  var parameters: [String: String]? {
    switch self {
    case .users:
      return nil

    case .posts(user: let user):
      return ["userId": String(user.id)]
    }
  }

  /// Convert this Endpoint into a usable URLRequest
  ///
  /// Sets necesary HTTP Headers and would be the place to
  /// configure POST bodies, or auth tokens or other things
  /// that could need applied to a request before it gets sent.
  func asURLRequest() -> URLRequest {
    var urlRequest = URLRequest(url: url.appendingPathComponent(path))

    if let parameters = parameters {
      if method == .get {
        var components = URLComponents()
        components.queryItems = parameters.map {
          URLQueryItem(name: $0, value: $1)
        }

        urlRequest.url = components.url(relativeTo: urlRequest.url)
      }
    }

    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
    urlRequest.setValue("keep-alive", forHTTPHeaderField: "Connection")

    return urlRequest
  }
}

// MARK: Internal Components to API Client

protocol APIProvider {
  func users() -> Observable<[User]>
  func posts(for user: User) -> Observable<[Post]>
}

class APIClient: APIProvider {
  func users() -> Observable<[User]> {
    return request(endpoint: .users)
      .map {
        guard let data = $0 else {
          return []
        }

        return try JSONDecoder().decode([User].self, from: data)
      }
  }

  func posts(for user: User) -> Observable<[Post]> {
    return request(endpoint: .posts(user: user))
      .map {
        guard let data = $0 else {
          return []
        }

        return try JSONDecoder().decode([Post].self, from: data)
    }
  }

  /// Take an Endpoint and perform the request to the API
  private func request(endpoint: Endpoint) -> Observable<Data?> {
    return Observable.create {
      observer in

      var task: URLSessionDataTask?

      let request = endpoint.asURLRequest()
      task = URLSession.shared.dataTask(with: request) {
        data, response, error in

        guard error == nil else {
          observer.onError(error!)
          return
        }

        observer.onNext(data)
        observer.onCompleted()
      }
      task?.resume()

      return Disposables.create {
        task?.cancel()
      }
    }
  }
}

/// Represents the HTTP method to use in the API call
enum Method: String {
  case get, post, put, patch
}
