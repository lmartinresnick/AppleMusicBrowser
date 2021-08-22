//
//  APIRequest.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/19/21.
//

import Foundation

public protocol APIRequest {
    
    associatedtype Response = Data
    
    var urlRequest: URLRequest { get }
    func decodeResponse(data: Data) throws -> Response
}

public enum APIRequestError: Error {
    case error(error: String)
    case invalidResponse(response: String)
    case invalidData
    case decodingError(error: String)
}
