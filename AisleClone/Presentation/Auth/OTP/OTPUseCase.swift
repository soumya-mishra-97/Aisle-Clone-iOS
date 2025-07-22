//
//  OTPUseCase.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import Foundation
import Combine

class OTPUseCase {
    func verifyOTP(number: String, otp: String) -> AnyPublisher<Bool, Error> {
        let params = ["number": number, "otp": otp]
        return APIService.shared.post(to: Endpoints.verifyOTP, parameters: params)
            .tryMap { data -> Bool in
                let response = try JSONDecoder().decode(OTPResponse.self, from: data)
                if let token = response.token {
                    TokenManager.shared.save(token: token)
                    return true
                } else {
                    throw NetworkError.custom(message: "Invalid token")
                }
            }
            .eraseToAnyPublisher()
    }
}
