//
//  UsersViewController.swift
//  RxAPI
//
//  Created by Kieran Graham on 12/10/2018.
//  Copyright © 2018 Kieran Graham. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa
import RxDataSources

class UsersViewController: UIViewController {
  @IBOutlet var tableView: UITableView!

  private let disposeBag = DisposeBag()

  let dataSource = RxTableViewSectionedReloadDataSource<UserTableViewSection>(configureCell: {
    (ds, tv, ip, user) -> UITableViewCell in

    let cell = tv.dequeueReusableCell(withIdentifier: UserTableViewCell.ID) as! UserTableViewCell

    cell.configure(user: user)

    return cell
  })

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 110

    tableView.register(UINib(nibName: UserTableViewCell.ID, bundle: nil), forCellReuseIdentifier: UserTableViewCell.ID)

    tableView.rx.modelSelected(User.self)
      .subscribe(onNext: {
        user in

        self.showPosts(user: user)
      })
      .disposed(by: disposeBag)

    API.users()
      .asDriver(onErrorJustReturn: [])
      .map { [UserTableViewSection(items: $0)] }
      .drive(tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    if let ip = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: ip, animated: true)
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let postsVC = segue.destination as! PostsViewController
    postsVC.selectedUser = sender as? User
  }

  private func showPosts(user: User) {
    self.performSegue(withIdentifier: "ShowUserPostsSegue", sender: user)
  }

}

// MARK: User Conformance to SectionModelType

struct UserTableViewSection {
  var items: [User] = []
}

extension UserTableViewSection: SectionModelType {
  typealias Item = User

  init(original: UserTableViewSection, items: [User]) {
    self = original
    self.items = items
  }
}
