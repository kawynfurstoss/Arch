// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import UIKit


class ImageCacheManager: CacheProtocol {
  typealias Key = String
  typealias Value = UIImage
  
  public var configuration: CacheConfiguration
  
  
  private let cache = NSCache<NSString, UIImage>()
  
  init(_ configuration: CacheConfiguration = CacheConfiguration.standard()) {
    cache.countLimit = configuration.countLimit
    cache.totalCostLimit = configuration.totalCostLimit
    self.configuration = configuration
  }
  
  func add(_ key: String, _ value: UIImage) {
    cache.setObject(value, forKey: key as NSString)
  }
  
  func get(forKey key: String) -> UIImage? {
    cache.object(forKey: key as NSString)
  }
  
  func remove(forKey key: String) {
    cache.removeObject(forKey: key as NSString)
  }
  
  func invalidate() {
    cache.removeAllObjects()
  }
  
  
  
}
