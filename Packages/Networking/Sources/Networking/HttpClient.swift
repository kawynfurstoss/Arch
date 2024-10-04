//
//  HttpClient.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/28/24.
//

import Foundation
import Combine

@available(iOS 13.0, *)
public protocol HttpClientProtocol {
  // using combine
  func publisher(request: URLRequest) -> AnyPublisher<(Data, HTTPURLResponse), Error>
  // using closures
  func perform(request: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void)
}

@available(iOS 13.0, *)
extension URLSession: HttpClientProtocol {
  struct InvalidHttpResponseError: Error {
  }
  
  public func publisher(request: URLRequest) -> AnyPublisher<(Data, HTTPURLResponse), Error> {
    return dataTaskPublisher(for: request)
      .tryMap({ result in
          guard let response = result.response as? HTTPURLResponse else {
            throw InvalidHttpResponseError()
        }
        return (result.data, response)
      })
      .eraseToAnyPublisher()
  }
  
  public func perform(request: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
    guard let url = request.url else { return completion(.failure(URLError(.badURL))) }
    // Use [weak self] to avoid retention cycles
    dataTask(with: url, completionHandler: { [weak self] data, response, error in
      
    })
  }
}

@available(iOS 13.0, *)
protocol TokenProvider {
  func tokenPublisher() -> AnyPublisher<String, Error>
}

// Authenticated Http Request
@available(iOS 13.0, *)
class AuthenticatedHttpClientDecorator: HttpClientProtocol {
  func perform(request: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), any Error>) -> Void) {
  }
  
  private let httpClient: HttpClientProtocol
//  private let token: String?
  // Token Provider
  private let tokenProvider: TokenProvider
  private var needsAuth: (() -> Void)?
  
  init(httpClient: HttpClientProtocol, tokenProvider: TokenProvider) {
    self.httpClient = httpClient
    self.tokenProvider = tokenProvider
  }
  
  func publisher(request: URLRequest) -> AnyPublisher<(Data, HTTPURLResponse), Error> {
//    var signedRequest = request
//    signedRequest.allHTTPHeaderFields?.removeValue(forKey: "Authorization")
//    signedRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//    return httpClient.publisher(request: signedRequest)
    
    return tokenProvider.tokenPublisher()
      .map({ token in
        var signedRequest = request
        signedRequest.allHTTPHeaderFields?.removeValue(forKey: "Authorization")
        signedRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return signedRequest
      })
      .flatMap(httpClient.publisher)
      .handleEvents(receiveCompletion: { [needsAuth] completion in
        if case let Subscribers.Completion<Error>.failure(error) = completion,
        case APIErrorHandler.tokenExpired? = error as? APIErrorHandler {
          needsAuth?()
        }
      })
      .eraseToAnyPublisher()
  }
  
  
}
