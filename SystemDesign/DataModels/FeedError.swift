//
//  FeedError.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/28/24.
//

import Foundation

enum FeedError: Error, LocalizedError {
  case invalidURL
  case invalidResponse
  case invalidData
  case invalidJSON
  
  var errorDescription: String? {
    switch self {
    case .invalidURL:
      "Invalid URL"
    case .invalidResponse:
      "Invalid response"
    case .invalidData:
      "Invalid data"
    case .invalidJSON:
      "Invalid JSON"
    }
  }
}
