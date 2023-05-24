//
//  UserDetailsSection.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import SwiftUI

struct UserDetailsSection: View {
    @ObservedObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            EditProfileRow(title: "Full Name", placeholder: "Fullname", text: $viewModel.fullname)
                .onAppear {
                    if let userFullname = viewModel.myProfile?.userFullname {
                        viewModel.fullname = userFullname
                    }
                }
            
            EditProfileRow(title: "Username", placeholder: "Username", text: $viewModel.username)
                .onAppear {
                    if let username = viewModel.myProfile?.username {
                        viewModel.username = username
                    }
                }
        }
        .foregroundColor(.white)
        .padding(.horizontal, 2)
        
    }
}

struct UserDetailsSection_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsSection(viewModel: AuthViewModel())
    }
}
