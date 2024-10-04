//
//  CacheConfiguration.swift
//  AdvancedCache
//
//  Created by Kawyn Furstoss on 10/3/24.
//

import Foundation

struct CacheConfiguration {
  var countLimit: Int
  var totalCostLimit: Int
  var expiration: TimeInterval
  
  static func standard() -> CacheConfiguration {
    return CacheConfiguration(
      countLimit: 200,
      totalCostLimit: 1024 * 1024 * 200,
      expiration: 24 * 60 * 60
    )
  }
}
