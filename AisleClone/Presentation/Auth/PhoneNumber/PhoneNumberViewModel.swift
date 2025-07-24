//
//  PhoneNumberViewModel.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import Foundation
import Combine

class PhoneNumberViewModel: ObservableObject {
    @Published var phoneNumber: String = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    func sendOTP(completion: @escaping (Bool) -> Void) {
        guard !phoneNumber.isEmpty else {
            errorMessage = "Phone number cannot be empty"
            completion(false)
            return
        }
        
        guard Validator.isValidPhone(phoneNumber) else {
            errorMessage = "Enter valid 10-digit number"
            completion(false)
            return
        }
        
        
        
        isLoading = true
        errorMessage = nil
        
        let params = ["number": "+91\(phoneNumber)"]
        APIService.shared.post(to: Endpoints.phoneNumberLogin, parameters: params)
            .decode(type: PhoneLoginResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completionResult in
                self?.isLoading = false
                if case .failure(let error) = completionResult {
                    self?.errorMessage = error.localizedDescription
                    completion(false)
                }
            } receiveValue: { [weak self] response in
                if response.status == true {
                    completion(true)
                } else {
                    self?.errorMessage = "Number isn't registered. Try with a registered number."
                    completion(false)
                }
            }
            .store(in: &cancellables)
        
    }
}
