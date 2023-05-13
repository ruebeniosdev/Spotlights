//
//  EditProfile.swift
//  Spotlights
//
//  Created by Rueben on 10/05/2023.
//

import SwiftUI
import SDWebImageSwiftUI
import PhotosUI
import UIKit

struct EditProfile: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: AuthViewModel
    @FocusState private var focus: FocusableField?
    @State private var scale: CGFloat = 0.1
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bg")
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            Button {
                                viewModel.isPresentingImagePicker.toggle()
                            } label: {
                                if let profileURL = viewModel.myProfile?.userProfileURL,
                                   let url = URL(string: profileURL) {
                                    VStack {
                                        ZStack(alignment: .bottomTrailing) {
                                            WebImage(url: url)
                                                .resizable()
                                                .scaledToFill()
                                                .foregroundColor(.white)
                                                .background(.gray)
                                                .clipShape(Circle())
                                                .frame(width: 80, height: 80)
                                                .overlay(Circle().stroke(Color("accent"), lineWidth: 2))
                                            Image(systemName: "plus")
                                                .foregroundColor(.white)
                                                .frame(width: 25, height: 25)
                                                .background(Color.blue)
                                                .clipShape(Circle())
                                                .overlay(Circle().stroke(Color("accent"), lineWidth: 2))
                                        }
                                        .scaleEffect(scale)
                                        .animation(.spring(), value: scale)
                                        .onAppear {
                                            scale = 1.0
                                        }
                                        Text("Edit profile picture")
                                            .font(.footnote)
                                            .fontWeight(.semibold)
                                    }
                                } else {
                                    ZStack(alignment: .bottomTrailing) {
                                        Image(systemName: "person")
                                            .resizable()
                                            .foregroundColor(.white)
                                            .background(.gray)
                                            .clipShape(Circle())
                                            .frame(width: 80, height: 80)
                                        Image(systemName: "plus")
                                            .foregroundColor(.white)
                                            .frame(width: 25, height: 25)
                                            .background(Color.blue)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                    }
                                }
                            }
                            
                            Divider()
                                .padding(.vertical, 8)
                            VStack(alignment: .leading, spacing: 16) {
                                EditProfileRow(title: "Full Name", placeholder: " Full name", text: $viewModel.fullname)
                                EditProfileRow(title: "User Name", placeholder: "User name", text: $viewModel.username)
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        }
                        .padding(.top, 30)
                    }
                }
                .navigationTitle("Edit Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            viewModel.updateUserProfilePicture()
                            viewModel.updateUsername(newUsername: viewModel.username)
                            viewModel.updateFullname(newFullname: viewModel.fullname) { success in
                                if success {
                                    // Fetch updated profile
                                    Task {
                                        await viewModel.fetchUserData()
                                    }
                                    // dismisses view
                                    viewModel.showSuccessAlert = true
                                    dismiss()
                                } else {
                                    // Handle update failure
                                    viewModel.showAlert = true
                                    viewModel.showSuccessAlert = false
                                }

                            }
                        }) {
                            Text("Done")
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                        .disabled(viewModel.username.isEmpty || viewModel.fullname.isEmpty)
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Text("Cancel")
                        }
                    }
                }
                .alert(viewModel.errorMessage, isPresented: $viewModel.showError, actions: {})
                .overlay {
                    LoadingView(show: $viewModel.isLoading)
                }
                .onDisappear {
                    Task {
                        await viewModel.fetchUserData()
                    }
                }
                .photosPicker(isPresented: $viewModel.isPresentingImagePicker, selection: $viewModel.photoItem)
                .onChange(of: viewModel.photoItem, perform: { newValue in
                    // extracting UIImage from photoItem
                    if let newValue {
                        Task {
                            do {
                                guard let imageData = try await newValue.loadTransferable(type: Data.self)  else { return }
                              
                                await MainActor.run(body: {
                                    viewModel.userProfilePicData = imageData
                                })
                            } catch {
                                // dop something
                            }
                        }
                    }
                })
            }
        }
        
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile(viewModel: AuthViewModel())
    }
}




