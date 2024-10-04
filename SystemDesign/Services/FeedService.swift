//
//  FeedService.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/28/24.
//
import Networking
import Foundation
import Combine
import UIKit
import AdvancedCache

class FeedProvider {
  
  static func feedRequest() -> URLRequest {
    return URLRequest(url: URL(string: "https://example.com/feed")!)
  }
}

protocol FeedServiceProtocol {
  func loadFeedItems() -> AnyPublisher<[FeedItem], Error>
  func loadImage(_ url: String, _ completion: @escaping (UIImage?) -> Void)
  func loadUsers(completion: @escaping ([String]) -> Void)
}

class FeedService<CacheManager: CacheProtocol>: FeedServiceProtocol  where CacheManager.Key == String, CacheManager.Value == UIImage {
    
  func loadUsers(completion: @escaping ([String]) -> Void) {
    // Simulate a delay (e.g., 2 seconds) for the network call
    DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
      var names = [String]()
      for index in 0...10 {
        names.append("User: \(index)")
      }
      completion(names)
    }
  }
  
  let httpClient: HttpClientProtocol
  let cacheManager: CacheManager
  
  init(httpClient: HttpClientProtocol, cacheManager: CacheManager) {
    self.httpClient = httpClient
    self.cacheManager = cacheManager
  }
  
  func loadFeedItems() -> AnyPublisher<[FeedItem], Error> {
    return httpClient.publisher(request: FeedProvider.feedRequest())
      .tryMap(FeedItemMapper.map)
      .eraseToAnyPublisher()
  }
  
  func loadImage(_ imageId: String, _ completion: @escaping (UIImage?) -> Void) {
    if let image = cacheManager.get(forKey: imageId) {
      completion(image)
      return
    }
    
    
    guard let url = URL(string: "https://picsum.photos/300/300") else { return }
    let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
      guard let data = data else { return }
      DispatchQueue.main.async {
        if let image = UIImage(data: data) {
          self?.cacheManager.add(imageId, image )
          completion(image)
        }
      }
    }
    task.resume()
  }
  
  
}
