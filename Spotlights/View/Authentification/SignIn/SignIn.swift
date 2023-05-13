//
//  SignIn.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI

struct SignIn: View {
    @State var showSignUp = false
    @Environment(\.dismiss) var dismiss
   // @Binding  var showingSignInView: Bool
    @StateObject var viewModel = AuthViewModel()
    @FocusState private var focus: FocusableField?
    var body: some View {
            VStack {
                Image("logo")
                    
                Text("Spotlight")
                    .font(.custom("Poppins-Bold", size: 24))
                    .foregroundColor(Color("accent"))
                VStack(spacing: 134) {
                    VStack(spacing: 16) {
                        CustomTextField(nameAttach: "Email", text: $viewModel.email, placeHolder: "Enter your email")
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                            .submitLabel(.next)
                            .focused($focus, equals: .email)
                            .onSubmit {
                                focus = .password
                            }
                       

                        CustomSecureField(nameAttach: "Password", password: $viewModel.password, placeHolder: "Enter your secure password")
                            .textContentType(.password)
                            .focused($focus, equals: .password)
                            .submitLabel(.done)
                            .onSubmit {
                                viewModel.loginUser()
                            }
                       
                           
                        HStack {
                            Spacer()
                            Button {
                                viewModel.showforgotPassword.toggle()
                            } label: {
                                Text("Forgot  password?")
                                    .font(.custom("Inter-Medium", size: 16))
                            }
                            .fullScreenCover(isPresented: $viewModel.showforgotPassword) {
                                ForgotPassword(viewModel: viewModel)
                            }

                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    
                    VStack(spacing: 16) {
                        VStack(spacing: 8) {
                            Text("By clicking 'Sign in' you agree to the")
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(Color.white)
                            Text("Terms of Use and Privacy Policy")
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(Color("accent"))
                                .multilineTextAlignment(.center)
                        }
                        
                       
                        ButtonMain(action: {
                            viewModel.loginUser()
                            
                        }, title: "Sign in")
                        .padding(.horizontal)
                        HStack(spacing: 0) {
                            Text("Don't have an account?")
                            Button {
                                self.showSignUp = true
                            } label: {
                                Text(" Sign up")
                            }
                        }
                        .font(.custom("Poppins-Regular", size: 17))
                        .foregroundColor(Color("accent"))
                    }
                }
                
            }
            .alert(viewModel.errorMessage, isPresented: $viewModel.showError, actions: {})
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("bg"))
            .fullScreenCover(isPresented: $showSignUp) {
                SignUpView(viewModel: viewModel)
            }
            .overlay {
                // Loading View
                LoadingView(show: $viewModel.isLoading)
            }
            .alert(isPresented: $viewModel.showAlertReset) {
                Alert(title: Text("Password Reset"),
                      message: Text(viewModel.errString ?? "Success. Reset email sent successfully.  Check your email"),
                      dismissButton: .default(Text("OK")) {
                    dismiss()
                })
            }
    }
    
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}




