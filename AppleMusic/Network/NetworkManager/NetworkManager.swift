//
//  NetworkManager.swift
//  AppleMusic
//
//  Created by Luke Martin-Resnick on 8/19/21.
//

import Foundation

public final class NetworkManager {
    static let shared = NetworkManager()
    
    func sendRequest<Request: APIRequest>(_ request: Request,
                                          completion: @escaping (Result<Request.Response, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: request.urlRequest) { (data, response, error) in
            guard error == nil else {
                completion(.failure(APIRequestError.error(error: String(describing: error))))
                return
            }
            guard response != nil else {
                completion(.failure(APIRequestError.invalidResponse(response: String(describing: error))))
                return
            }
            guard let data = data else {
                completion(.failure(APIRequestError.invalidData))
                return
            }
            do {
                let decodedResponse = try request.decodeResponse(data: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(APIRequestError.decodingError(error: "\(error)")))
            }
        }
        task.resume()
    }
}
