//
//  PostTableViewCellViewModel.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/29/24.
//

import UIKit


struct PostTableViewCellViewModel {
  let userName: String
  let caption: String
  var image: UIImage?
  var photoId: UUID
  init(_ userName: String, _ caption: String, _ image: UIImage? = nil) {
    self.userName = userName
    self.caption = caption
    self.image = image
    self.photoId = UUID()
  }
}
