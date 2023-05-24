//
//  LogoutSection.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct LogoutSection: View {
    @State private var showLogout = false
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Log Out")
                .font(.custom("Poppins-Medium", size: 16))
                .foregroundColor(Color("textfieldcolor"))
            LogoutButton(action: { showLogout = true }, title: "Log Out")
                .alert("Are you sure, You want to Log Out?", isPresented: $showLogout) {
                    Button("Yes", role: .destructive, action: { viewModel.signOut() })
                }
        }
    }
}


struct LogoutSection_Previews: PreviewProvider {
    static var previews: some View {
        LogoutSection(viewModel: AuthViewModel())
    }
}
