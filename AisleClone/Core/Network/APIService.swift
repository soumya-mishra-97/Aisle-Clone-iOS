//
//  APIService.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import Foundation
import Combine

class APIService {
    static let shared = APIService()
    
    private init() {}

    // MARK: - POST Request
    func post(to urlString: String, parameters: [String: Any]) -> AnyPublisher<Data, NetworkError> {
        guard let url = URL(string: urlString) else {
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let token = TokenManager.shared.getToken() {
            request.setValue(token, forHTTPHeaderField: "Authorization")
        }

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            return Fail(error: .custom(message: "Invalid parameters")).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { result in
                guard let response = result.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw NetworkError.custom(message: "Server Error")
                }
                return result.data
            }
            .mapError { ($0 as? NetworkError) ?? .custom(message: $0.localizedDescription) }
            .eraseToAnyPublisher()
    }

    // MARK: - GET Request
    func get(from urlString: String, headers: [String: String]? = nil) -> AnyPublisher<Data, NetworkError> {
        guard let url = URL(string: urlString) else {
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        if let token = TokenManager.shared.getToken(), headers?["Authorization"] == nil {
            request.setValue(token, forHTTPHeaderField: "Authorization")
        }

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { result in
                guard let response = result.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw NetworkError.custom(message: "Server Error")
                }
                return result.data
            }
            .mapError { ($0 as? NetworkError) ?? .custom(message: $0.localizedDescription) }
            .eraseToAnyPublisher()
    }
}
