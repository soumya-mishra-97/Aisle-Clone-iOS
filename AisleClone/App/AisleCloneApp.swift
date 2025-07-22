//
//  AisleCloneApp.swift
//  AisleClone
//
//  Created by Soumya Mishra on 17/07/25.
//

import SwiftUI

@main
struct AisleCloneApp: App {
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ZStack {
                    if showSplash {
                        SplashView()
                    } else {
                        PhoneNumberView()
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation {
                            showSplash = false
                        }
                    }
                }
            }
        }
    }
}
