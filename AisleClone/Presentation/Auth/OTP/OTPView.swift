//
//  OTPView.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import SwiftUI

struct OTPView: View {
    let number: String
    @StateObject private var viewModel = OTPViewModel()
    @FocusState private var isFocused: Bool
    @State private var showNotes = false
    @State private var showSnackbar = false
    @State private var selectedTab: BottomTab = .home

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("+91 \(number)")
                    .headingStyle(size: 18, weight: .medium)

                Button(action: {
                   print("Edit")
                }) {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .bold()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.black)
                }
            }

            Text("Enter the\nOTP")
                .headingStyle(size: 30, weight: .bold)

            TextField("9999", text: $viewModel.otp)
                .focused($isFocused)
                .onChange(of: viewModel.otp) { _, newValue in
                    let filtered = newValue.filter { $0.isNumber }
                    viewModel.otp = String(filtered.prefix(4))
                    if viewModel.otp.count == 4 {
                        isFocused = false
                    }
                }
                .frame(width: 78)
                .otpInputStyle()
                .keyboardType(.numberPad)

            HStack {
                Button(action: {
                    viewModel.verifyOTP(for: number) { success in
                        if success {
                            showNotes = true
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
                        .headingStyle(size: 16, weight: .medium)
                        .frame(width: 110, height: 50)
                        .background(Color(hex: "#F9CB10"))
                        .cornerRadius(25)
                }

                Text(viewModel.timerString)
                    .captionBoldStyle()
                    .foregroundColor(.gray)
            }

            Spacer()
            
            .navigationDestination(isPresented: $showNotes) {
                BottomTabBarView(token: viewModel.token ?? "null")
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .onAppear {
            viewModel.startTimer()
            isFocused = true
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.white)
        .snackbar(message: viewModel.errorMessage ?? "", isVisible: $showSnackbar)
    }
}


struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OTPView(number: "9876543210")
        }
    }
}
