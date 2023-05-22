////
////  ReusableEditProfile.swift
////  Spotlights
////
////  Created by Rueben on 10/05/2023.
////
//
//import SwiftUI
//import SDWebImageSwiftUI
//
//struct ReusableEditProfile: View {
//    var user: User?
//    @ObservedObject var viewModel: AuthViewModel
//    @FocusState private var focus: FocusableField?
//    var body: some View {
//        VStack {
//            if user != nil {
//                WebImage(url:  user!.userProfileURL)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 100, height: 100)
//                    .clipShape(Circle())
//                    .onTapGesture {
//                        viewModel.showingSheet = true
//                        viewModel.isPresentingImagePicker.toggle()
//                    }
//            } else {
//                ZStack {
//                    Circle()
//                        .fill(Color("primary"))
//                        .frame(width: 40, height: 40)
//
//                    Text("J").font(.custom("Poppins-Medium", size: 18.3)).tracking(-0.14)
//                        .foregroundColor(.black)
//                }
//                .frame(width: 100, height: 100)
//                .clipShape(Circle())
//                .onTapGesture {
//                    viewModel.showingSheet = true
//                    viewModel.isPresentingImagePicker.toggle()
//                }
//            }
//
//
//            VStack(alignment: .leading, spacing: 16) {
//                CustomTextField(nameAttach: "Full name", text: $viewModel.fullname, placeHolder: "Enter your full name")
//                    .keyboardType(.namePhonePad)
//                    .textContentType(.familyName)
//                    .submitLabel(.next)
//                    .focused($focus, equals: .fullname)
//                    .onSubmit {
//                        focus = .username
//                    }
//                CustomTextField(nameAttach: "Username", text: $viewModel.username, placeHolder: "Enter your username")
//                    .textInputAutocapitalization(.never)
//                    .keyboardType(.namePhonePad)
//                    .textContentType(.username)
//                    .submitLabel(.next)
//                    .focused($focus, equals: .username)
//                    .onSubmit {
//                        focus = .email
//                    }
//                ButtonMain(action: {viewModel.updateUserProfileImageAndUsername()}, title: "Save Changes")
//                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
//
//            }
//
//        }
//
//    }
//}
//
