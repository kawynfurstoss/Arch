//
//  MainCoordinator.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/29/24.
//

import UIKit
import Networking

class MainCoordinator: Coordinator {
  var children: [Coordinator] = []
  var navigationController: UINavigationController
  
  // MARK: Dependencies
  var httpClient: HttpClientProtocol
  var feedService: FeedServiceProtocol
  
  init(navigationController: UINavigationController) {
    self.httpClient = URLSession.shared
    self.feedService = FeedService(httpClient: httpClient)
    self.navigationController = navigationController
  }
  
  func start() {
    let vc = HomeViewController(HomeViewModel(self))
    navigationController.pushViewController(vc, animated: false)
  }
  
  func goToFeed() {
    let vc = FeedViewController(FeedViewModel(self.feedService, self))
    navigationController.pushViewController(vc, animated: true)
  }
}
