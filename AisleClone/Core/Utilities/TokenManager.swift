//
//  TokenManager.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import Foundation

class TokenManager {
    static let shared = TokenManager()

    private let tokenKey = "authToken"

    func save(token: String) {
        UserDefaults.standard.set(token, forKey: tokenKey)
    }

    func getToken() -> String? {
        UserDefaults.standard.string(forKey: tokenKey)
    }

    func clearToken() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
