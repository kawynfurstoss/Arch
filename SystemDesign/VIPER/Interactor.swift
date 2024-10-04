//
//  Interactor.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/27/24.
//

import Foundation
import UIKit

// object
// protocol
// ref to presenter

protocol AnyInteractor {
  associatedtype Presenter: AnyPresenter
  var presenter: Presenter? { get set }
  
  func getUsers()
  }

class PhotoInteractor: AnyInteractor {
  var presenter: PhotoPresenter?

  var feedService: FeedServiceProtocol?
  
  func getUsers() {
    // Implement API request
  }
  
  
  func downloadImage(completion: ((UIImage?) -> Void)?) {
    feedService?.loadImage("testId"){ [weak self] image in
      guard let image else { return }
      self?.presenter?.downloadImage(image: image)
    }
  }
}

class UserInteractor: AnyInteractor {
  var presenter: UserPresenter?
  
  func getUsers() {
    // Implement API request
  }
}

