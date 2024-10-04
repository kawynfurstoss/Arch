//
//  UserFollowingTableViewCell.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/27/24.
//

import UIKit

class PostTableViewCell: UITableViewCell {
  static let identifier = "PostTableViewCell"
  
  // UI components
  let postImageView = UIImageView()
  let usernameLabel = UILabel()
  let captionLabel = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupPostImage()
    setupCaptionLabel()
    setupUserNameLabel()
    layoutConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
  }
    
  private func layoutConstraints() {
    // Layout constraints
    NSLayoutConstraint.activate([
        // Image View Constraints
        postImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
        postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        postImageView.heightAnchor.constraint(equalToConstant: 250),
        
        // Username Label Constraints
        usernameLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8),
        usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
        usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        
        // Caption Label Constraints
        captionLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 4),
        captionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
        captionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        captionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
    ])
  }
  
  private func setupPostImage() {
    // Set up the image view
    postImageView.contentMode = .scaleAspectFill
    postImageView.clipsToBounds = true
    postImageView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(postImageView)
  }
  
  private func setupUserNameLabel() {
    // Set up the username label
    usernameLabel.font = UIFont.boldSystemFont(ofSize: 16)
    usernameLabel.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(usernameLabel)
  }
  
  private func setupCaptionLabel() {
    // Set up the caption label
    captionLabel.numberOfLines = 0 // Allow for multiple lines
    captionLabel.font = UIFont.systemFont(ofSize: 14)
    captionLabel.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(captionLabel)
  }
}
