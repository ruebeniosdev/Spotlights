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
                                VStack {
                                    if let profileURL = viewModel.myProfile?.userProfileURL,
                                       let url = URL(string: profileURL) {
                                        VStack {
                                            ZStack {
                                                WebImage(url: url)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 80, height: 80)
                                                    .clipShape(Circle())
                                                    .overlay {
                                                        Circle()
                                                            .stroke(LinearGradient(colors: [.red,.purple,.red,.orange,.yellow,.orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.3)
                                                    }
                                                ZStack {
                                                    Circle()
                                                        .fill(Color.blue)
                                                        .frame(width: 25, height: 25)
                                                    
                                                    Image(systemName: "plus")
                                                        .font(Font.system(size: 16, weight: .bold))
                                                        .foregroundColor(.white)
                                                    
                                                    Circle().stroke(Color.white, lineWidth: 2)
                                                        .frame(width: 25, height: 25)
                                                }
                                                .offset(x: 35, y: 30)
                                            }
                                            .scaleEffect(scale)
                                            .animation(.spring(), value: scale)
                                            .onAppear {
                                                scale = 1.0
                                            }
                                        }
                                        
                                    } else {
                                        ZStack {
                                            Image(systemName: "person.circle.fill")
                                                .resizable()
                                                .frame(width: 80, height: 80)
                                                .clipShape(Circle())
                                                .foregroundColor(Color(.systemGray4))
                                                .overlay {
                                                    Circle()
                                                        .stroke(LinearGradient(colors: [.red,.purple,.red,.orange,.yellow,.orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.3)
                                                }
                                            ZStack {
                                                Circle()
                                                    .fill(Color.blue)
                                                    .frame(width: 25, height: 25)
                                                
                                                Image(systemName: "plus")
                                                    .font(Font.system(size: 16, weight: .bold))
                                                    .foregroundColor(.white)
                                                
                                                Circle().stroke(Color.white, lineWidth: 2)
                                                    .frame(width: 25, height: 25)
                                            }
                                            .offset(x: 35, y: 30)
                                        }
                                    }
                                    Text("Edit profile picture")
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Divider()
                                }
                                .padding(.vertical, 8)
                            }
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
                        .padding(.vertical, 30)
                    }
                }
                .navigationTitle("Edit Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
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
                        }
                        .font(.subheadline)
                        .fontWeight(.bold)
//                        .disabled(viewModel.fullname.isEmpty || viewModel.username.isEmpty)
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                        .foregroundColor(.primary)
                    }
                }
                .alert(viewModel.errorMessage, isPresented: $viewModel.showError, actions: {})
//                .overlay {
//                    LoadingView(show: $viewModel.isLoading)
//                }
                .onDisappear {
                    Task {
                        await viewModel.fetchUserData()
                    }
                }
                .onTapGesture {
                    viewModel.closeKeyboard() // Dismiss the keyboard
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
                                    // Update the profile image placeholder with the selected image
                                    if let newImage = UIImage(data: imageData) {
                                        viewModel.myProfile?.userProfileURL = saveImageToDocumentDirectory(image: newImage)
                                    }
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
    func saveImageToDocumentDirectory(image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 0.8),
              let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        let fileName = UUID().uuidString + ".jpg"
        let fileURL = directory.appendingPathComponent(fileName)
        
        do {
            try data.write(to: fileURL)
            return fileURL.absoluteString
        } catch {
            // handle error
            return nil
        }
    }
    
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile(viewModel: AuthViewModel())
    }
}
