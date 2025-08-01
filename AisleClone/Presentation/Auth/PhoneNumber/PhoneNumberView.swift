//
//  PhoneNumberView.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import SwiftUI

struct PhoneNumberView: View {
    @StateObject private var viewModel = PhoneNumberViewModel()
    @State private var showOTP = false
    @State private var showSnackbar = false
    @FocusState private var isPhoneFieldFocused: Bool
    
    init() {
        for family in UIFont.familyNames {
            print("Family: \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   - \(name)")
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Get OTP")
                .headingStyle(size: 18, weight: .regular)
            
            Text("Enter Your\nPhone Number")
                .headingStyle(size: 30, weight: .bold)
            
            HStack(spacing: 12) {
                Text("+91")
                    .frame(width: 64, height: 36)
                    .inputStyle()
                
                TextField("9999999999", text: $viewModel.phoneNumber)
                    .focused($isPhoneFieldFocused)
                    .onChange(of: viewModel.phoneNumber) { oldValue, newValue in
                        let filtered = newValue.filter { $0.isNumber }
                        viewModel.phoneNumber = String(filtered.prefix(10))
                        if viewModel.phoneNumber.count == 10 {
                            isPhoneFieldFocused = false
                        }
                    }
                    .frame(width: 145, height: 36)
                    .inputStyle()
            }
            
            Button(action: {
                viewModel.sendOTP { success in
                    if success {
                        showOTP = true
                    } else {
                        withAnimation {
                            showSnackbar = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation {
                                showSnackbar = false
                            }
                        }
                    }
                }
            }) {
                Text("Continue")
                    .headingStyle(size: 14, weight: .semibold)
                    .frame(width: 96, height: 40)
                    .background(Color(hex: "#F9CB10"))
                    .cornerRadius(25)
            }
            .padding(.top, 4)
            
            Spacer()
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .navigationBarHidden(true)
        
        .navigationDestination(isPresented: $showOTP) {
            OTPView(number: viewModel.phoneNumber)
        }
        .snackbar(message: viewModel.errorMessage ?? "", isVisible: $showSnackbar)
    }
}

struct PhoneNumberView_Preview: PreviewProvider {
    static var previews: some View {
        PhoneNumberView()
    }
}
