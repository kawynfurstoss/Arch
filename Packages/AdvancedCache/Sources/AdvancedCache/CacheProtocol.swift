//
//  CacheProtocol.swift
//  AdvancedCache
//
//  Created by Kawyn Furstoss on 10/3/24.
//

import UIKit


public protocol CacheProtocol {
  associatedtype Key
  associatedtype Value

  func add(_ key: Key, _ value: Value) -> Void
  func get(forKey key: Key) -> Value?
  func remove(forKey key: Key) -> Void
  func invalidate()
}

