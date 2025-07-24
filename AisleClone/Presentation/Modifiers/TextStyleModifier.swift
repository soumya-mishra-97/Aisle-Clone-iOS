//
//  TextStyleModifier.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import SwiftUI

private enum Fonts {
    static let helvetica = "HelveticaNeue"
    static let avenir = "AvenirNext"
}

private enum Defaults {
    static let defaultSize: CGFloat = 18
    static let defaultWeight: Font.Weight = .medium
    static let defaultColor: Color = .black
}

// MARK: - Input Field Styles

struct BaseInputStyle: ViewModifier {
    let borderOpacity: Double
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 4)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: "#C4C4C4"), lineWidth: 1)
            )
            .cornerRadius(10)
            .font(.custom(Fonts.helvetica, size: Defaults.defaultSize).weight(.semibold))
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
    }
}

typealias PhoneInputStyle = BaseInputStyle
typealias OTPInputStyle = BaseInputStyle

// MARK: - Text Styles

struct HeadingStyle: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.custom(Fonts.helvetica, size: size).weight(weight))
            .foregroundColor(Defaults.defaultColor)
    }
}

struct CaptionBoldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom(Fonts.helvetica, size: 14).weight(.semibold))
            .foregroundColor(Defaults.defaultColor)
    }
}

struct CaptionStyle: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(Fonts.helvetica, size: size).weight(weight))
            .foregroundColor(color)
    }
}

struct TitleStyle: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(Fonts.helvetica, size: size).weight(weight))
            .foregroundColor(color)
    }
}

struct SubHeadingStyle: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(Fonts.avenir, size: size).weight(weight))
            .foregroundColor(color)
    }
}

struct CalloutStyle: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(Fonts.avenir, size: size).weight(weight))
            .foregroundColor(color)
    }
}


struct ErrorStyle: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(Fonts.helvetica, size: size).weight(weight))
            .foregroundColor(color)
    }
}

// MARK: - View Extension

extension View {
    func inputStyle() -> some View {
        self.modifier(PhoneInputStyle(borderOpacity: 0.4))
    }
    
    func otpInputStyle() -> some View {
        self.modifier(OTPInputStyle(borderOpacity: 0.5))
    }
    
    func headingStyle(size: CGFloat = Defaults.defaultSize, weight: Font.Weight = Defaults.defaultWeight) -> some View {
        self.modifier(HeadingStyle(size: size, weight: weight))
    }
    
    func captionBoldStyle() -> some View {
        self.modifier(CaptionBoldStyle())
    }
    
    func captionStyle(size: CGFloat = Defaults.defaultSize, weight: Font.Weight = Defaults.defaultWeight, color: Color = Defaults.defaultColor) -> some View {
        self.modifier(CaptionStyle(size: size, weight: weight, color: color))
    }
    
    func titleStyle(size: CGFloat = Defaults.defaultSize, weight: Font.Weight = Defaults.defaultWeight, color: Color = Defaults.defaultColor) -> some View {
        self.modifier(TitleStyle(size: size, weight: weight, color: color))
    }
    
    func subHeadingStyle(size: CGFloat = Defaults.defaultSize, weight: Font.Weight = Defaults.defaultWeight, color: Color = Defaults.defaultColor) -> some View {
        self.modifier(SubHeadingStyle(size: size, weight: weight, color: color))
    }
    
    func callOutStyle(size: CGFloat = Defaults.defaultSize, weight: Font.Weight = Defaults.defaultWeight, color: Color = Defaults.defaultColor) -> some View {
        self.modifier(CalloutStyle(size: size, weight: weight, color: color))
    }
    
    func errorStyle(size: CGFloat = Defaults.defaultSize, weight: Font.Weight = Defaults.defaultWeight, color: Color = .red) -> some View {
        self.modifier(ErrorStyle(size: size, weight: weight, color: color))
    }
}
