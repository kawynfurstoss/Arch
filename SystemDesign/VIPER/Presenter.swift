//
//  Presenter.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/27/24.
//

import Foundation
import UIKit

// Object
// Protocol
// ref to interactor, router, view



protocol AnyPresenter {
  associatedtype Interactor: AnyInteractor
  associatedtype Router: AnyRouter
  associatedtype View: AnyView

  var router: Router? { get set }
  var interactor: Interactor? { get set }
  var view: View? { get set }
  
  func interactorDidFetchUsers(with result: Result<[User], Error>)

}

class PhotoPresenter: AnyPresenter {
  var interactor: PhotoInteractor?
  var router: UserRouter?
  var view: UserViewController?
  

  func interactorDidFetchUsers(with result: Result<[User], any Error>) {
    
  }
  
  func downloadImage(image: UIImage) {
    
  }
  
}

  
class UserPresenter: AnyPresenter {
  
  var router: UserRouter?
  var interactor: UserInteractor? {
    didSet {
      interactor?.getUsers()
    }
  }
  var view: UserViewController?
  
  init() {
    interactor?.getUsers()
  }
  
  func interactorDidFetchUsers(with result: Result<[User], any Error>) {
    switch result {
    case . success(let users):
      view?.update(with: users)
    case .failure(let error):
      print(error)
    }
  }
}
