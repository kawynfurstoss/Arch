//
//  FeedViewModel.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/27/24.
//

import UIKit


final class FeedViewModel {
  
  var error: ObservableObject<String?> = ObservableObject(nil)
  
  var posts: ObservableObject<[PostTableViewCellViewModel]> = ObservableObject([])
  
  let feedService: FeedServiceProtocol
  let coordinator: MainCoordinator

  init(_ feedService: FeedServiceProtocol, _ coordinator: MainCoordinator) {
    self.feedService = feedService
    self.coordinator = coordinator
    fetchFeed()
  }
  
  func fetchFeed() {
    feedService.loadUsers(completion: { [weak self] users in
      for user in users {
        var post = PostTableViewCellViewModel(user, "FooBar")
        self?.posts.value.append(post)
      }
    })
  }
  
  func loadImage(imageId: String, completion: @escaping (UIImage?) -> Void) {
    feedService.loadImage(imageId) { image in
      completion(image)
    }
  }
}
