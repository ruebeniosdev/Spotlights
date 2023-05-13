//
//  Main.swift
//  Spotlights
//
//  Created by Rueben on 16/04/2023.
//

import SwiftUI

struct Main: View {
    @AppStorage("log_status") var logStatus = false
    @AppStorage("onboarding_completed") var onboardingCompleted = false
    var body: some View {
        // MARK: Redirecting user based on log Status
        ZStack {
            if logStatus {
                ContentView()
            } else if onboardingCompleted {
                SignIn()
            } else {
                OnboardingView()
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
