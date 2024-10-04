//
//  ViewController.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/27/24.
//

import UIKit


class FeedViewController: UIViewController, UITableViewDataSource {
  
  
  private let viewModel: FeedViewModel
  
  init(_ viewModel: FeedViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private let tableView: UITableView = {
    let table = UITableView()
    table.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
    return table
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemPink
    view.addSubview(tableView)
    setupTableView()
    layoutConstraints()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.posts.value.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let post = viewModel.posts.value[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
    cell.usernameLabel.text = post.userName
    viewModel.loadImage(imageId: post.photoId.uuidString, completion: { image in
      cell.postImageView.image = image
    })
    cell.captionLabel.text = post.caption
    return cell
  }
  
  private func setupTableView() {
    tableView.dataSource = self
    tableView.frame = view.bounds
    tableView.translatesAutoresizingMaskIntoConstraints = false
    viewModel.posts.bind { [weak self] _ in
      DispatchQueue.main.async {
        self?.tableView.reloadData()
      }
    }
  }
  
  private func layoutConstraints() {
    NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), // Aligns with the top of the safe area
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor), // Aligns with the left edge of the view
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor), // Aligns with the right edge of the view
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor) // Aligns with the bottom of the safe area
    ])
  }
}
