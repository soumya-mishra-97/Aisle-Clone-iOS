//
//  TextStyleModifier.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import SwiftUI

struct PhoneInputStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .frame(height: 55)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
            .cornerRadius(10)
            .font(.custom("TimesNewRomanPSMT", size: 20).weight(.medium))
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
    }
}

struct OTPInputStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .frame(height: 55)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
            .cornerRadius(10)
            .font(.custom("TimesNewRomanPSMT", size: 24).weight(.medium))
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
    }
}

struct HeadingStyle: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight

    func body(content: Content) -> some View {
        content
            .font(.custom("TimesNewRomanPSMT", size: size).weight(weight))
            .foregroundColor(.black)
    }
}

struct CaptionBoldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("TimesNewRomanPSMT", size: 16).weight(.bold))
            .foregroundColor(.black)
    }
}

struct CaptionStyle: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    let color: Color

    func body(content: Content) -> some View {
        content
            .font(.custom("TimesNewRomanPSMT", size: size).weight(weight))
            .foregroundColor(color)
    }
}


extension View {
    func inputStyle() -> some View {
        self.modifier(PhoneInputStyle())
    }

    func otpInputStyle() -> some View {
        self.modifier(OTPInputStyle())
    }

    func headingStyle(size: CGFloat = 18, weight: Font.Weight = .medium) -> some View {
        self.modifier(HeadingStyle(size: size, weight: weight))
    }
    
    func captionBoldStyle() -> some View {
        self.modifier(CaptionBoldStyle())
    }
    
    func captionStyle(size: CGFloat = 18, weight: Font.Weight = .medium, color: Color = .black) -> some View {
        self.modifier(CaptionStyle(size: size, weight: weight, color: color))
    }
}
