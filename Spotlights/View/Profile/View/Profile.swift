//
//  Profile.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI

struct Profile: View {
    @ObservedObject var viewModel: AuthViewModel
    @State private var isAtive = false
    // MARK: my profile data
   // @State private var myProfile: User?
    @AppStorage("log_status") var logStatus: Bool = false
    var body: some View {
        ZStack {
            Color("bg")
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Text("Account Profile")
                        .font(.custom("Poppins-SemiBold", size: 18))
                        .foregroundColor(.black)
                    Spacer()
                    Button {
                    } label: {
                        Image(systemName: "questionmark.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(.white)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 35) {
                        UserAccountSection(viewModel: viewModel)
                        
                        ChangePasswordSection(viewModel: viewModel)
                        
                        LogoutSection(viewModel: viewModel)
                        
                        DeleteAccountSection(isAtive: $isAtive)
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
            }
            .overlay {
                if isAtive {
                    CustomDialog(isActive: $isAtive, icon: "star.circle.fill", message: "If you delete your account we will be unable to restore your information. You will also lose the opportunity to grow your social media accounts organically.", buttonTitle: "Yes, I Understand The Risk", action: {})
                }
            }
            .overlay {
                // Loading View
                LoadingView(show: $viewModel.isLoading)
            }
         
            .alert(viewModel.errorMessage, isPresented: $viewModel.showError, actions: {})
            .task {
                // MARK: Initial Fetch
                if viewModel.myProfile == nil {
                    await viewModel.fetchUserData()
                }
            }
            .refreshable {
                self.viewModel.myProfile = nil
                await viewModel.fetchUserData()
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Profile(viewModel: AuthViewModel())
        }
    }
}
