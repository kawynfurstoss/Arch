//
//  APIMapper.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/28/24.
//

import Foundation

// very easy to unit test the result
// Not coupled to any framework, combine, async/await, closures
struct APIMapper {
  static func map<T: Decodable>(from data: Data, response: HTTPURLResponse) throws -> T {
    if response.statusCode == 200 {
      
    }
    if response.statusCode == 400 {
      
    }
    return try JSONDecoder().decode(T.self, from: data)
  }
}

struct FeedItemMapper {
  static func map(from data: Data, response: HTTPURLResponse) throws -> [FeedItem] {
    if response.statusCode == 200 {
      
    }
    if response.statusCode == 400 {
      
    }
    return try JSONDecoder().decode([FeedItem].self, from: data)
  }
}


