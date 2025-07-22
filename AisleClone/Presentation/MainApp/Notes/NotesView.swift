//
//  NotesView.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import SwiftUI

struct NotesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            /// Header
            VStack(spacing: 8) {
                Text("Notes")
                    .headingStyle(size: 28, weight: .bold)
                
                Text("Personal messages to you")
                    .foregroundColor(.black)
                    .captionStyle(size: 16, weight: .regular)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 12)

            /// Profile card
            ProfileCardView()

            /// Upgrade Section
            UpgradeView()

            /// Blurred Profiles
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    BlurredProfileView(imageName: "photo-1", name: "Aditi")
                    BlurredProfileView(imageName: "photo-1", name: "Meghna")
                    BlurredProfileView(imageName: "photo-1", name: "Akanksha")
                }
                .padding(.horizontal, 20)
            }

            Spacer()
        }
        .padding(.top)
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
            .previewDevice("iPhone 15 Pro")
    }
}

