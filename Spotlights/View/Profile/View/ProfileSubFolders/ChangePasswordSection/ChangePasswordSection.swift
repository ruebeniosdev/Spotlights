//
//  ChangePasswordSection.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct ChangePasswordSection: View {
    @State private var showChange = false
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Change Password")
                .font(.custom("Poppins-Medium", size: 16))
                .foregroundColor(Color("textfieldcolor"))
            ButtonMain(action: { showChange.toggle() }, title: "Change")
                .fullScreenCover(isPresented: $showChange) {
                    ChangePassword(viewModel: viewModel)
                }
        }
    }
}


struct ChangePasswordSection_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordSection(viewModel: AuthViewModel())
    }
}
