//
//  ProfileImageView.swift
//  AisleClone
//
//  Created by Soumya Mishra on 24/07/25.
//

import SwiftUI

struct ProfileImageView: View {
    var imageURL: String?
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageURL ?? "")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .scaleEffect(1.2)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.gray.opacity(0.1))
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure:
                    Text("Not Found")
                        .errorStyle(size: 35)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                @unknown default:
                    EmptyView()
                }
            }
        }
        .clipped()
    }
}
