//
//  HelperView.swift
//  Spotlights
//
//  Created by Rueben on 13/05/2023.
//

import SwiftUI

struct HelperView: View {
    @Environment(\.dismiss) var dismiss
    @FocusState private var focus: FocusableField?
    @ObservedObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding(.trailing, 46)
            .padding(.top, 28)
            VStack(alignment: .center, spacing: 17) {
                VStack {
                    Button {
                        viewModel.showingSheet = true
                        viewModel.isPresentingImagePicker.toggle()
                    } label: {
                        ZStack {
                            if let userProfilePicData = viewModel.userProfilePicData, let image = UIImage(data: userProfilePicData) {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                            } else {
                                ZStack {
                                    Image("imagePic")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 19)
                                        .padding()
                                        .frame(width: 80, height: 80)
                                        .background(Color("offwhite"))
                                        .clipShape(Circle())
                                }
                            }
                        }
                        .frame(width: 85, height: 85)
                    }

                    HStack(spacing: 0) {
                        Text("upload a picture")
                        Text(" *")
                            .foregroundColor(Color("asterisk"))
                    }
                    .font(.custom("Poppins-Regular", size: 14))
                    .foregroundColor(.white)
                }
                VStack(spacing: 16) {
                    CustomTextField(nameAttach: "Full name", text: $viewModel.fullname, placeHolder: "Enter your full name")
                        .keyboardType(.namePhonePad)
                        .textContentType(.familyName)
                        .submitLabel(.next)
                        .focused($focus, equals: .fullname)
                        .onSubmit {
                            focus = .username
                        }
                    CustomTextField(nameAttach: "Username", text: $viewModel.username, placeHolder: "Enter your username")
                        .textInputAutocapitalization(.never)
                        .keyboardType(.namePhonePad)
                        .textContentType(.username)
                        .submitLabel(.next)
                        .focused($focus, equals: .username)
                        .onSubmit {
                            focus = .email
                        }
                    CustomTextField(nameAttach: "E-mail", text: $viewModel.email, placeHolder: "example@gmail.com")
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
                            viewModel.createNewAccount()
                        }
                }
                .foregroundColor(.white)
                .padding(.horizontal)
                // Spacer()
                VStack(spacing: 16) {
                    VStack(spacing: 8) {
                        Text("By clicking 'Create an Account' you agree to the")
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(Color.white)
                        Text("Terms of Use and Privacy Policy")
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(Color("accent"))
                            .multilineTextAlignment(.center)
                    }
                    ButtonMain(action: {
                        viewModel.createNewAccount()
                    }, title: "Create an account")
                    .padding(.horizontal)
                    .disableWithOpacity(viewModel.email.isEmpty || viewModel.email.contains("@") || viewModel.password.count > 5 || viewModel.password.isEmpty || viewModel.fullname.isEmpty || viewModel.username.isEmpty || viewModel.userProfilePicData == nil)
                    .opacity(viewModel.email.isEmpty || viewModel.email.contains("@") || viewModel.password.count > 5 || viewModel.password.isEmpty || viewModel.fullname.isEmpty || viewModel.username.isEmpty || viewModel.userProfilePicData == nil ? 0.5 : 0)
                    HStack(spacing: 0) {
                        Text("Have an account?")
                        Button {
                            dismiss()
                        } label: {
                            Text(" Sign in")
                        }
                    }
                    .font(.custom("Poppins-Regular", size: 17))
                    .foregroundColor(Color("accent"))
                }
            }
        }
         // Prevents the keyboard from affecting the layout
    }
}

struct HelperView_Previews: PreviewProvider {
    static var previews: some View {
        HelperView(viewModel: AuthViewModel())
    }
}
