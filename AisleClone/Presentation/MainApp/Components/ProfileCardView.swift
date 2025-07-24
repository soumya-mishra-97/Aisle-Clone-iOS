//
//  ProfileCardView.swift
//  AisleClone
//
//  Created by Soumya Mishra on 18/07/25.
//

import SwiftUI

struct ProfileCardView: View {
    var imageURL: String?
    var name: String
    var age: Int
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ProfileImageView(imageURL: imageURL)
                .frame(height: 345)
                .cornerRadius(20)
                .padding(.horizontal, 20)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.6), .clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(name), \(age)")
                    .foregroundColor(.white)
                    .titleStyle(size: 22, weight: .bold)
                
                Text("Tap to review 50+ notes")
                    .foregroundColor(.white)
                    .subHeadingStyle(size: 15, weight: .medium)
            }
            .padding(.leading, 35)
            .padding(.bottom, 20)
        }
    }
}

struct ProfileCardView_Preview: PreviewProvider {
    static var previews: some View {
        ProfileCardView(
            imageURL: "https://testimages.aisle.co/f39552690128813a6e893b4f4cd725fc729869938.png",
            name: "Mayank",
            age: 29
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
