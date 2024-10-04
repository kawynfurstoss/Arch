//
//  PhotoCell.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/28/24.
//

import Foundation
import UIKit

class PhotoCell: UITableViewCell {
  
  private let photo: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(photo)
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    photo.image = nil
  }
  
  private func addContraints() {
    NSLayoutConstraint.activate([
      photo.widthAnchor.constraint(equalToConstant: 300),
      photo.heightAnchor.constraint(equalToConstant: 300),
      photo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
      ])
  }
  
//  func configure(with presenter: PhotoPresenter) {
//    presenter.downloadImage { [weak self] image in
//      
//    }
//  }
}
