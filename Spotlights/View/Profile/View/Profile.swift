//
//  Profile.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI

struct Profile: View {
    @State var isAtive = false
    @State var showLogout = false
    @State var showChange = false
    @State var showEdit = false
    @State var showConfirmPassword = false
    @ObservedObject var viewModel: AuthViewModel
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
                        VStack(alignment: .leading, spacing: 16) {
                            Text("User Account")
                                .font(.custom("Poppins-Medium", size: 16))
                                .foregroundColor(Color("textfieldcolor"))
                            HStack {
                                Button {
                                    showEdit.toggle()
                                } label: {
                                    HStack(spacing: 16) {
                                        if let profile = viewModel.myProfile {
                                            ReusableProfile(user: profile,viewModel: viewModel)
                                                .refreshable {
                                                    self.viewModel.myProfile = nil
                                                    await viewModel.fetchUserData()
                                                }
                                        } else {
                                            ProgressView()
                                        }
                                        
                                        Spacer()
                                        Image(systemName: "checkmark")
                                            .foregroundColor(Color("textfieldcolor"))
                                    }
                                    .frame(height: 40)
                                }
                                .fullScreenCover(isPresented: $showEdit) {
                                    EditProfile(viewModel: viewModel)
                                }
                            }
                            .padding(22)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 7)
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                }
                            )
                        }
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Change Password")
                                .font(.custom("Poppins-Medium", size: 16))
                                .foregroundColor(Color("textfieldcolor"))
                            ButtonMain(action: {showChange.toggle()}, title: "Change")
                                .fullScreenCover(isPresented: $showChange) {
                                    ChangePassword(viewModel: viewModel)
                                }
                               
                            
                        }
                        // Change password
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Log Out")
                                .font(.custom("Poppins-Medium", size: 16))
                                .foregroundColor(Color("textfieldcolor"))
                            LogoutButton(action: {showLogout = true}, title: "Log Out")
                                .alert("Are you sure, You want to Log Out?", isPresented: $showLogout) {
                                    Button("Yes", role: .destructive, action: {viewModel.signOut()})
                                }
                        }
                        // deleting
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Delete Account")
                                .font(.custom("Poppins-Medium", size: 16))
                                .foregroundColor(Color("textfieldcolor"))
                            VStack(alignment: .leading,spacing: 16) {
                                HStack(spacing: 8) {
                                    Image(systemName: "trash")
                                        .font(.title3)
                                    Text("Delete your account")
                                        .font(.custom("Poppins-Bold", size: 24))
                                        .multilineTextAlignment(.center)
                                }
                                .foregroundColor(.white)
                        Text("This action is irreversible. it will delete \nyour personal account and activity.")
                                    .font(.custom("Poppins-Medium", size:17))
                                    .foregroundColor(Color("textfieldcolor"))
                                HStack {
                                    Spacer()
                                    Button {
                                        self.isAtive.toggle()
                                    } label: {
                                        Text("Delete Account")
                                            .font(.custom("Poppins-Medium", size: 15.58))
                                            .foregroundColor(Color("asterisk 2"))
                                            .multilineTextAlignment(.center)
                                            .padding()
                                            .frame(width: 164, height: 46)
                                            .background(
                                                ZStack {
                                                    RoundedRectangle(cornerRadius: 7)
                                                        .fill(Color(#colorLiteral(red: 0.9215686321258545, green: 0.3490196168422699, blue: 0.2235294133424759, alpha: 1)))
                                                        .opacity(0.2)
                                                    RoundedRectangle(cornerRadius: 7)
                                                        .strokeBorder(Color(#colorLiteral(red: 0.9215686321258545, green: 0.3490196168422699, blue: 0.2235294133424759, alpha: 1)), lineWidth: 2)
                                                }
                                            )
                                    }
                                }
                            }
                            .padding()
                            .frame(height: 222)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(Color(#colorLiteral(red: 0.8708333373069763, green: 0.903124988079071, blue: 1, alpha: 0.4000000059604645)), lineWidth: 1)
                            )
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
            }
            .overlay {
                if isAtive {
                    CustomDialog(isActive: $isAtive, icon: "star.circle.fill", message: "If you delete your account we will be unable to restore your information. You will also lose the opportunity to grow your social media accounts organically.", buttonTitle: "Yes, I Understand The Risk",action: {viewModel.deleteAccount()})
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
