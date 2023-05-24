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
    @State private var scale: CGFloat = 0.5
    @Namespace var animation
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bg")
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ProfilePictureSection(viewModel: viewModel)
                            UserDetailsSection(viewModel: viewModel)
                        }
                        .padding(.vertical, 30)
                    }
                }
                .navigationTitle("Edit Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        DoneButton(viewModel: viewModel, dismiss: dismiss)
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        CancelButton(dismiss: dismiss)
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
                                        viewModel.myProfile?.userProfileURL = newImage.saveImageToDocumentDirectory()
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

    
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile(viewModel: AuthViewModel())
    }
}


