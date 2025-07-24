//
//  NotesView.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import SwiftUI

struct NotesView: View {
    @StateObject private var viewModel: NotesViewModel
    
    init(token: String) {
        _viewModel = StateObject(wrappedValue: NotesViewModel(token: token))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            /// Header
            VStack(spacing: 8) {
                Text("Notes")
                    .headingStyle(size: 27, weight: .bold)
                
                Text("Personal messages to you")
                    .foregroundColor(.black)
                    .subHeadingStyle(size: 18, weight: .medium)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    /// Loading State
                    if viewModel.isLoading {
                        VStack {
                            Spacer()
                            ProgressView()
                                .scaleEffect(1.2)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    
                    /// Error State
                    if viewModel.errorMessage != nil {
                        VStack {
                            Spacer()
                            Text("Not Found")
                                .errorStyle(size: 35)
                                .multilineTextAlignment(.center)
                                .padding()
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    
                    /// Profile Card
                    if let topProfile = viewModel.invitedProfiles.first {
                        ProfileCardView(
                            imageURL: topProfile.avatarURL,
                            name: topProfile.name,
                            age: topProfile.age
                        )
                    }
                    
                    /// Upgrade View
                    UpgradeView()
                    
                    
                    /// Liked Profiles Card
                    if !viewModel.likedProfiles.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(viewModel.likedProfiles) { liked in
                                    BlurredProfileView(
                                        imageURL: liked.avatar,
                                        name: liked.firstName
                                    )
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    
                    Spacer()
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
        }
        .onAppear {
            viewModel.fetchNotes()
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView(token: "32c7794d2e6a1f7316ef35aa1eb34541")
    }
}
