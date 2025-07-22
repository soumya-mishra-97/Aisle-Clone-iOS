//
//  OTPViewModel.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import Foundation
import Combine

class OTPViewModel: ObservableObject {
    @Published var otp: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var isOTPVerified: Bool = false
    @Published var token: String?
    
    private var timer: Timer?
    @Published var timerValue: Int = 60
    
    var cancellables = Set<AnyCancellable>()
    
    var timerString: String {
        timerValue > 0 ? "00:\(String(format: "%02d", timerValue))" : "Resend OTP"
    }
    
    var isValid: Bool {
        Validator.isValidOTP(otp)
    }
    
    func startTimer() {
        timerValue = 60
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timerValue > 0 {
                self.timerValue -= 1
            } else {
                self.timer?.invalidate()
            }
        }
    }
    
    func verifyOTP(for number: String, completion: @escaping (Bool) -> Void) {
        guard isValid else {
            errorMessage = "Enter valid 4-digit OTP"
            isOTPVerified = false
            completion(false)
            return
        }
        
        isOTPVerified = true
        token = "mock_token_123"
        completion(true)
        
        /// API Implementation (commented for demo/test mode)
        /*
         isLoading = true
         errorMessage = nil
         
         let parameters = [
         "number": "+91\(number)",
         "otp": otp
         ]
         
         APIService.shared.post(to: Endpoints.verifyOTP, parameters: parameters)
         .decode(type: OTPResponse.self, decoder: JSONDecoder())
         .receive(on: DispatchQueue.main)
         .sink { [weak self] completionResult in
         self?.isLoading = false
         switch completionResult {
         case .failure(let error):
         self?.errorMessage = error.localizedDescription
         completion(false)
         case .finished:
         break
         }
         } receiveValue: { [weak self] response in
         if let token = response.token {
         self?.token = token
         self?.isOTPVerified = true
         completion(true)
         } else {
         self?.errorMessage = "Invalid OTP, please try again"
         completion(false)
         }
         }
         .store(in: &cancellables)
         */
    }
}
