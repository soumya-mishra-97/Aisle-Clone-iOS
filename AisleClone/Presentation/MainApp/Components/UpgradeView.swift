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
                    .captionStyle(size: 15, weight: .regular)
            }

            Spacer()

            Button(action: {}) {
                Text("Upgrade")
                    .font(.system(size: 16, weight: .bold))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color(hex: "#F9CB10"))
                    .foregroundColor(.black)
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
