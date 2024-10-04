//
//  HomeViewModel.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/29/24.
//
import Foundation

final class HomeViewModel {
  
  let coordinator: MainCoordinator
  
  init(_ coordinator: MainCoordinator) {
    self.coordinator = coordinator
  }
  
  func buttonTapped() {
    coordinator.goToFeed()
  }
}

