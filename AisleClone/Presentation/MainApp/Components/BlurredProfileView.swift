//
//  BlurredProfileView.swift
//  AisleClone
//
//  Created by Soumya Mishra on 18/07/25.
//

import SwiftUI

struct BlurredProfileView: View {
    var imageURL: String
    var name: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ProfileImageView(imageURL: imageURL)
                .frame(width: 168, height: 255)
                .blur(radius: 8)
                .overlay(
                    Color.black.opacity(0.4)
                )
                .cornerRadius(20)
            
            Text(name)
                .foregroundColor(.white)
                .titleStyle(size: 22, weight: .bold)
                .padding([.leading, .bottom], 16)
        }
    }
}

struct BlurredProfileView_Preview: PreviewProvider {
    static var previews: some View {
        BlurredProfileView(
            imageURL: "https://testimages.aisle.co/dd510d5260eeebcdc7d7fc752c598c39728894004.png",
            name: "Ajith"
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
