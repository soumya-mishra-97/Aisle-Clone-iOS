//
//  BlurredProfileView.swift
//  AisleClone
//
//  Created by Soumya Mishra on 18/07/25.
//

import SwiftUI

struct BlurredProfileView: View {
    var imageName: String
    var name: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 220)
                .blur(radius: 8)
                .overlay(
                    Color.black.opacity(0.3)
                )
                .cornerRadius(20)
            
            Text(name)
                .foregroundColor(.white)
                .headingStyle(size: 20, weight: .black)
                .padding(.leading, 16)
                .padding(.bottom, 16)
        }
        .frame(width: 160, height: 220)
    }
}

struct BlurredProfileView_Preview: PreviewProvider {
    static var previews: some View {
        BlurredProfileView(imageName: "photo-1", name: "Teena")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
