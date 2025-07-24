//
//  UpgradeView.swift
//  AisleClone
//
//  Created by Soumya Mishra on 18/07/25.
//

import SwiftUI

struct UpgradeView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Interested In You")
                    .headingStyle(size: 22, weight: .bold)
                
                Text("Premium members can\nview all their likes at once")
                    .foregroundColor(.gray)
                    .subHeadingStyle(size: 15, weight: .medium)
            }
            
            Spacer()
            
            Button(action: {}) {
                Text("Upgrade")
                    .headingStyle(size: 15, weight: .semibold)
                    .frame(width: 100, height: 50)
                    .background(Color(hex: "#F9CB10"))
                    .cornerRadius(25)
            }
        }
        .padding(.horizontal, 35)
    }
}

struct UpgradeView_Previews: PreviewProvider {
    static var previews: some View {
        UpgradeView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
