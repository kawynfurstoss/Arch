//
//  View.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/27/24.
//

import Foundation
import UIKit
// ViewController
// protocol
// reference to Presenter

protocol AnyView {
  associatedtype Presenter: AnyPresenter

  var presenter: Presenter? { get set }
  
  func update(with users: [User])
  func update(with error: String)
}

class UserViewController: UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource {

  var presenter: UserPresenter?
  
  var users: [User] = []
  
  private let tableView: UITableView = {
    let table = UITableView()
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    table.isHidden = true
    return table
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBlue
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }
  
  func update(with users: [User]) {
    DispatchQueue.main.async {
      self.users = users
      self.tableView.reloadData()
      self.tableView.isHidden = false
    }
  }
  
  func update(with error: String) {
    
  }
  
  // Table View
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = users[indexPath.row].name
    return cell
  }
  
}
