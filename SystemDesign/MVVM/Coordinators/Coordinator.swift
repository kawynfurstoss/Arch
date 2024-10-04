//
//  Coordinator.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/29/24.
//

import UIKit


protocol Coordinator {
  var children: [Coordinator] { get set }
  var navigationController: UINavigationController { get set }
  func start()
}
