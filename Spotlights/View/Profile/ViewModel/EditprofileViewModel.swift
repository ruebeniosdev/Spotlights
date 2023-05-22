//
//  EditprofileViewModel.swift
//  Spotlights
//
//  Created by Rueben on 21/05/2023.
//

import PhotosUI
import SwiftUI
import Firebase

@MainActor
class EditprofileViewModel: ObservableObject {
    @Published var user: User
    @Published var myProfile: User?

    @Published  var username = ""
    @Published  var fullname = ""
    @Published var profileImage: Image?
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task {await loadImage(fromItem: selectedImage)}}
    }
    
    private var uiImage:  UIImage?
    
    init(user: User) {
        self.user = user
       

    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
        
    }

    func updateuserDate() async throws {
        guard let userUID = Auth.auth().currentUser?.uid else {
            return
        }
        // update profile image if changed
        var data = [String: Any]()
        if let uiImage = uiImage {
          let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["Profile_Images"] = imageUrl
        }
        
        // update profile image if changed
        if !fullname.isEmpty && user.userFullname != fullname {
            data["fullname"] = fullname
        }
        // update profile image if changed
        if !username.isEmpty && user.username != username {
            data["username"] = username
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("Users").document(userUID).updateData(data)
        }
    }
}
