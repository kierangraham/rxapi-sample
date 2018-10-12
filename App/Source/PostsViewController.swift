//
//  PostsViewController.swift
//  RxAPI
//
//  Created by Kieran Graham on 12/10/2018.
//  Copyright © 2018 Kieran Graham. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa
import RxDataSources

class PostsViewController: UIViewController {
  @IBOutlet var tableView: UITableView!

  private let disposeBag = DisposeBag()

  var selectedUser: User?

  let dataSource = RxTableViewSectionedReloadDataSource<PostTableViewSection>(configureCell: {
    (ds, tv, ip, post) -> UITableViewCell in

    let cell = tv.dequeueReusableCell(withIdentifier: PostTableViewCell.ID) as! PostTableViewCell

    cell.configure(post: post)

    return cell
  })

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 200
    tableView.allowsSelection = false

    tableView.register(UINib(nibName: PostTableViewCell.ID, bundle: nil), forCellReuseIdentifier: PostTableViewCell.ID)

    if let selectedUser = selectedUser {
      API.posts(for: selectedUser)
        .asDriver(onErrorJustReturn: [])
        .map { [PostTableViewSection(items: $0)] }
        .drive(tableView.rx.items(dataSource: dataSource))
        .disposed(by: disposeBag)
    }
  }
}

// MARK: Post Conformance to SectionModelType

struct PostTableViewSection {
  var items: [Post] = []
}

extension PostTableViewSection: SectionModelType {
  typealias Item = Post

  init(original: PostTableViewSection, items: [Post]) {
    self = original
    self.items = items
  }
}
