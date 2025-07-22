//
//  NetworkError.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

enum NetworkError: Error {
    case invalidURL
    case unauthorized
    case custom(message: String)

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL."
        case .unauthorized: return "Unauthorized access."
        case .custom(let msg): return msg
        }
    }
}
