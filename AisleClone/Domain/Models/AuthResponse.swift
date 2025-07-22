//
//  AuthResponse.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import Foundation

struct PhoneLoginResponse: Codable {
    let status: Bool
}

struct OTPResponse: Codable {
    let token: String?
}
