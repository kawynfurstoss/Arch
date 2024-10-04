//
//  FileSystemCache.swift
//  AdvancedCache
//
//  Created by Kawyn Furstoss on 10/3/24.
//

import UIKit

class ImageFileManager: CacheProtocol {
  typealias Key = String
  typealias Value = UIImage
  
  private let fileManager = FileManager.default
  var folderName: String
  
  init(folderName: String) {
    self.folderName = folderName
  }
  
  
  func add(_ key: String, _ value: UIImage) {
    guard let data = value.pngData(), let url = getImagePath(key) else { return }
    do {
      try data.write(to: url)
    } catch {
      print("Error writing image to disk: \(error)")
    }
  }
  
  func get(forKey key: String) -> UIImage? {
    guard let url = getImagePath(key),  fileManager.fileExists(atPath: url.path) else { return nil }
    return UIImage(contentsOfFile: url.path)
  }
  
  func remove(forKey key: String) {
    guard let url = getImagePath(key) else { return }
    do {
      try fileManager.removeItem(atPath: url.path)
    } catch {
      print("Error removing image from disk: \(error)")
    }
  }
  
  func invalidate() {
    if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
      do {
        let items = try fileManager.contentsOfDirectory(at: documentsDirectory, includingPropertiesForKeys: nil)
        for item in items {
          try fileManager.removeItem(at: item)
          print("Removed item at: \(item)")
        }
        print("All items cleared from directory: \(documentsDirectory)")
      } catch {
        print("Error clearing directory: \(error.localizedDescription)")
      }
    }
  }
  
  private func createFolderIfNeeded() {
    guard let url = folderPath else { return }
    if !fileManager.fileExists(atPath: url.path) {
      do {
        try fileManager.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        print("Created folder: \(url)")
      } catch {
        print("Error creating folder: \(error)")
      }
    }
  }
  
  
  private var folderPath: URL? {
    fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent(folderName)
  }
  
  private func getImagePath(_ key: String, _ imageType: ImageType = .png) -> URL? {
    guard let folder = folderPath else { return nil }
    return folder.appendingPathComponent(key + imageType.imageExtension())
  }

  
}

enum ImageType {
  case jpeg
  case png
  
  func imageExtension() -> String {
    switch self {
    case .jpeg: return ".jpeg"
    case .png: return ".png"
    }
  }
}
