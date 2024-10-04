//
//  CachedItem.swift
//  AdvancedCache
//
//  Created by Kawyn Furstoss on 10/3/24.
//

import Foundation


struct CachedItem<T: Codable>: Codable {
    var key: String
    var object: T
    var creationDate: Date
}
