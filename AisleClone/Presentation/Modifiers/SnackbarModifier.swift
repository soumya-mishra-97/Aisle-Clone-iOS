//
//  SnackbarModifier.swift
//  AisleClone
//
//  Created by Soumya Mishra on 18/07/25.
//

import SwiftUI

struct SnackbarModifier: ViewModifier {
    let message: String
    @Binding var isVisible: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isVisible {
                VStack {
                    Spacer()
                    Text(message)
                        .captionStyle(size: 11,weight: .semibold, color: .white)
                        .padding([.horizontal, .vertical], 12)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(8)
                        .padding(.bottom, 30)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                .animation(.easeInOut(duration: 0.3), value: isVisible)
            }
        }
    }
}

extension View {
    func snackbar(message: String, isVisible: Binding<Bool>) -> some View {
        self.modifier(SnackbarModifier(message: message, isVisible: isVisible))
    }
}
