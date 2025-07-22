//
//  Validator.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//


import Foundation

struct Validator {
    static func isValidPhone(_ phone: String) -> Bool {
        let trimmed = phone.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.count == 10 && trimmed.allSatisfy { $0.isNumber }
    }

    static func isValidOTP(_ otp: String) -> Bool {
        let trimmed = otp.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.count == 4 && trimmed.allSatisfy { $0.isNumber }
    }
}
