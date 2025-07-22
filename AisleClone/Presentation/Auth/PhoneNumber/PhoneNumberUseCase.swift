//
//  PhoneNumberUseCase.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import Foundation
import Combine

class PhoneNumberUseCase {
    func sendPhoneNumber(_ number: String) -> AnyPublisher<String, Error> {
        let params = ["number": number]
        return APIService.shared.post(to: Endpoints.phoneNumberLogin, parameters: params)
            .tryMap { data in
                let responseStr = String(data: data, encoding: .utf8) ?? "No response"
                return responseStr
            }
            .eraseToAnyPublisher()
    }
}
