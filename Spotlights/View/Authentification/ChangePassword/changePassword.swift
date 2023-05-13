//
//  changePassword.swift
//  Spotlights
//
//  Created by Rueben on 26/04/2023.
//

import SwiftUI

struct ChangePassword: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: AuthViewModel
    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title3)
                            .foregroundColor(Color("accent"))
                    }
                    .padding(.top)
                    Spacer()

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
                            Text("Change your password")
                                .font(.custom("Inter-Bold", size: 24))
                                .multilineTextAlignment(.center)
                        }
                        VStack(spacing: 34) {
                            CustomSecureField(nameAttach: "Enter old password", password: $viewModel.password, placeHolder: "Password")
                                .textContentType(.password)
                            CustomSecureField(nameAttach: "Enter New Password", password: $viewModel.newpassword, placeHolder: "New Password")
                                .textContentType(.password)
                            ButtonMain(action: {
                                viewModel.updateUserPassword() { success in
                                    if success {
                                        dismiss()
                                    }
                                }
                               
                            }, title: "Confirm Password Change")
                            .disabled(viewModel.password.isEmpty || viewModel.newpassword.isEmpty)
                            .opacity(viewModel.password.isEmpty || viewModel.newpassword.isEmpty ? 0.5 : 0)
                        }
                    }
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal)
            .frame(maxHeight: .infinity,alignment: .top)
            .alert(viewModel.errorMessage, isPresented: $viewModel.showError, actions: {})
        }
        .overlay {
            // Loading View
            LoadingView(show: $viewModel.isLoading)
        }
    }
}

struct ChangePassword_Previews: PreviewProvider {
    static var previews: some View {
        ChangePassword(viewModel: AuthViewModel())
    }
}
