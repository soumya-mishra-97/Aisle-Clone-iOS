//
//  BottomTabBarView.swift
//  AisleClone
//
//  Created by Soumya Mishra on 18/07/25.
//

import SwiftUI

enum BottomTab: Int {
    case home, notes, matches, profile
}

struct BottomTabBarView: View {
    @State private var selectedTab: BottomTab = .notes
    let token: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    Text("Dashboard View")
                        .headingStyle(size: 24, weight: .bold)
                case .notes:
                    NotesView(token: token)
                case .matches:
                    Text("Matches View")
                        .headingStyle(size: 24, weight: .bold)
                case .profile:
                    Text("Profile View")
                        .headingStyle(size: 24, weight: .bold)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            
            HStack(spacing: 0) {
                tabButton(tab: .home, icon: "square.grid.2x2.fill", label: "Discover")
                tabButton(tab: .notes, icon: "envelope.fill", label: "Notes", badge: "9")
                tabButton(tab: .matches, icon: "bubble.left.fill", label: "Matches", badge: "50+")
                tabButton(tab: .profile, icon: "person.fill", label: "Profile")
            }
            .frame(height: 72)
            .background(Color.white.shadow(radius: 2))
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationBarBackButtonHidden()
    }
    
    @ViewBuilder
    private func tabButton(tab: BottomTab, icon: String, label: String, badge: String? = nil) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack(spacing: 4) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: icon)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(selectedTab == tab ? .black : .gray)
                    
                    if let badge = badge {
                        BadgeView(countText: badge)
                            .offset(badgeOffset(for: tab))
                    }
                }
                
                Text(label)
                    .callOutStyle(size: 12, weight: .medium, color: Color(hex: "#9B9B9B"))
                    .foregroundColor(selectedTab == tab ? .black : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    private func badgeOffset(for tab: BottomTab) -> CGSize {
        switch tab {
        case .notes:
            return CGSize(width: 10, height: -8)
        case .matches:
            return CGSize(width: 15, height: -8)
        default:
            return CGSize(width: 10, height: -10)
        }
    }
}

struct BadgeView: View {
    var countText: String
    
    var body: some View {
        Text(countText)
            .callOutStyle(size: 11, weight: .bold, color: Color.white)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(Color(hex: "#8C5CFB"))
            .clipShape(Capsule())
            .overlay(
                Capsule().stroke(Color.white, lineWidth: 1)
            )
    }
}

#Preview {
    BottomTabBarView(token: "32c7794d2e6a1f7316ef35aa1eb34541")
}
