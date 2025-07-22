//
//  Endpoints.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

struct Endpoints {
    /// Base URL
    static let baseURL = "https://app.aisle.co/V1"

    /// Send phone number for login
    static var phoneNumberLogin: String {
        "\(baseURL)/users/phone_number_login"
    }

    /// Verify OTP
    static var verifyOTP: String {
        "\(baseURL)/users/verify_otp"
    }

    /// Fetch user notes (requires auth token)
    static var notes: String {
        "\(baseURL)/users/test_profile_list"
    }
}
