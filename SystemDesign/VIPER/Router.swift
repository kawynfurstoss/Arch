//
//  Router.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/27/24.
//

import Foundation
import UIKit

// Object
// Entry Point

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
  var entry: (any EntryPoint)? { get }
  static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
  var entry: (any EntryPoint)?
  
  static func start() -> AnyRouter {
    let router = UserRouter()
  
    // Assign VIP
    var view: UserViewController = UserViewController()
    var presenter: UserPresenter = UserPresenter()
    var interactor: UserInteractor = UserInteractor()
    
    view.presenter = presenter
    interactor.presenter = presenter
    presenter.interactor = interactor
    presenter.router = router
    presenter.view = view
    
    router.entry = view 
    
    return router
  }
}

