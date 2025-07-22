//
//  SplashView.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import SwiftUI

struct SplashView: View {
    @State private var heartOffset: CGFloat = -25
    @State private var heartBounce = false
    @State private var textOpacity = 0.0
    @State private var scale: CGFloat = 0.8
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 24) {
                ZStack(alignment: .topLeading) {
                    HStack(spacing: 0) {
                        Text("a")
                        Text("ı")
                            .overlay(
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    .foregroundColor(.pink)
                                    .offset(y: heartOffset)
                                    .opacity(heartBounce ? 1 : 0)
                                    .animation(.interpolatingSpring(stiffness: 300, damping: 10).delay(0.3), value: heartBounce)
                            )
                        Text("sle")
                    }
                    .font(.system(size: 56, weight: .bold))
                    .foregroundColor(.black)
                }
                .scaleEffect(scale)
                .animation(.spring(response: 0.6, dampingFraction: 0.6), value: scale)
                
                Text("Nothing casual about\nthis dating app")
                    .captionStyle(size: 18, weight: .regular)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .opacity(textOpacity)
                    .animation(.easeIn(duration: 0.6).delay(0.6), value: textOpacity)
            }
        }
        .onAppear {
            scale = 1.0
            textOpacity = 1.0
            heartBounce = true
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
