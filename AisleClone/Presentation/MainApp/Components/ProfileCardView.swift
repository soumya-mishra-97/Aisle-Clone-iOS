//
//  ProfileCardView.swift
//  AisleClone
//
//  Created by Soumya Mishra on 18/07/25.
//

import SwiftUI

struct ProfileCardView: View {
    var imageName: String = "photo-1"
    var name: String = "Shreya"
    var age: Int = 27

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 280)
                .cornerRadius(20)
                .padding(.horizontal, 20)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                )

            VStack(alignment: .leading, spacing: 4) {
                Text("\(name), \(age)")
                    .foregroundColor(.white)
                    .headingStyle(size: 24, weight: .black)

                Text("Tap to review 50+ notes")
                    .foregroundColor(.white)
                    .headingStyle(size: 16, weight: .bold)
            }
            .padding(.leading, 35)
            .padding(.bottom, 20)
        }
    }
}


struct ProfileCardView_Preview: PreviewProvider {
    static var previews: some View {
        ProfileCardView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
