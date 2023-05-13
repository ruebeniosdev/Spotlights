//
//  ForgotPassword.swift
//  Spotlights
//
//  Created by Rueben on 12/04/2023.
//

import SwiftUI

struct ForgotPassword: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: AuthViewModel
    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title3)
                            .foregroundColor(Color("accent"))
                    }
                    .padding(.top)

                }
                VStack(spacing: 56) {
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 16, height: 20)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 44, height: 44)
                        .background(Color("accent").opacity(0.4))
                        .clipShape(Circle())
                    VStack(spacing: 52) {
                        VStack(spacing: 24) {
                            Text("Forgot your password?")
                                .font(.custom("Inter-Bold", size: 24))
                                .multilineTextAlignment(.center)
                            Text("No worries! Enter your email address we’ll\nsend you a verification link so you can\nsecurely reset your password.")
                                .font(.custom("Inter-Regular", size: 17))
                                .multilineTextAlignment(.center)
                        }
                        VStack(spacing: 34) {
                            CustomTextField(nameAttach: "Email", text: $viewModel.email, placeHolder: "example@email.com")
                            ButtonMain(action: {
                                viewModel.resetPassword()
                            }, title: "Send Verification Link")
                        }
                    }
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal)
            .frame(maxHeight: .infinity, alignment: .top)
            .alert(viewModel.errorMessage, isPresented: $viewModel.showError, actions: {})
        }
        .overlay {
            // Loading View
            LoadingView(show: $viewModel.isLoading)
        }
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword(viewModel: AuthViewModel())
    }
}
