//
//  ObservableObject.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/27/24.
//


// Used to bind the ViewModel to the View
final class ObservableObject<T> {
  var value: T {
    didSet {
      listener?(value)
    }
  }
  var listener: ((T) -> Void)?
  
  init(_ value: T) {
    self.value = value
  }
  
  func bind(_ listener: @escaping(T) -> Void) {
    listener(value)
    self.listener = listener
  }
}
