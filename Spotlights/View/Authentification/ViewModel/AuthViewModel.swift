//
//  AuthViewModel.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import UIKit
import FirebaseFirestore
import PhotosUI
import SwiftUI
import Combine

@MainActor
class AuthViewModel: ObservableObject {
    @Published var fullname: String = ""
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var newpassword: String = ""
    @Published var showforgotPassword = false
    @Published var errors: [LoginError] = []
    @Published var loginStatusMessage: String = ""
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var isPresentingImagePicker = false
    @Published var showingSheet = false
    @Published var isCurrentlyLoggedOut = false
    @Published var isLoading = false
    @Published  var userProfilePicData: Data?
    @Published  var photoItem: PhotosPickerItem?
    @Published var showLogOutDailogBox = false
    @Published var showAlert = false
    @Published var alertMessage = ""
    @Published var myProfile: User?
    @Published var profileImage: Image?
    @Published var selectedImage: UIImage?
    @Published var isCancellingUpload = false
    @Published var showAlertReset = false
    @Published var errString: String?
    @Published var showSuccessAlert = false
    
    private var uiImage:  UIImage?

  
    // MARK: UserDefaults
    @AppStorage("log_status")  var logStatus = false
    @AppStorage("user_profile_url") var profileURL: String?
    @AppStorage("user_name")  var userNameStored = ""
    @AppStorage("user_UID")  var userID: String = ""
    
    func fetchUserData() async {
        guard let userUID = Auth.auth().currentUser?.uid else { return }
        guard let user = try? await Firestore.firestore().collection("Users").document(userUID).getDocument(as: User.self) else { return }
        await MainActor.run(body: {
            myProfile = user
        })
    }
    
    
    func closeKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    // Firebase Displaying error via alert
    func setError(_ error: Error)async {
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            showError.toggle()
            isLoading = false
        })
    }
    // If User FOund then fetching User data from FireStire create account
    func fetchUser() async throws {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let user = try await Firestore.firestore().collection("Users").document(userID).getDocument(as: User.self)
        // MARK: setting user defaults data and changing app auth status
        await MainActor.run(body: {
            self.userID = userID
            userNameStored = user.username
            profileURL = user.userProfileURL
            logStatus = true
        })
    }
    // Firebase create account
    func createNewAccount() {
        self.isLoading = true
        closeKeyboard()
        Task {
            do {
                // Step 1: Creating Firebase account
                try await Auth.auth().createUser(withEmail: email, password: password)
                // Step 2: Uploading Profile
                guard let userID = Auth.auth().currentUser?.uid else { return }
                guard let imageData = self.userProfilePicData else { return }
                let storageRef = Storage.storage().reference().child("Profile_Images").child(userID)
                let _ = try await storageRef.putDataAsync(imageData)
                // Step 3: downloading Profile
                let downloadURL = try await storageRef.downloadURL()
                // Step 4: creating usrt Profile
                let user = User(username: userNameStored, userFullname: fullname, userEmail: email, userProfileURL: downloadURL.absoluteString)
                
                // Step 5: saving user doc
                let _ = try Firestore.firestore().collection("Users").document(userID).setData(from: user, completion: { [self] error in
                    if error == nil {
                        // saved succesfully
                        print("Saved Successfully")
                        self.userNameStored = self.username
                        self.userID = self.fullname
                        self.profileURL = downloadURL.absoluteString
                        self.logStatus = true
                    }
                })
            } catch {
                await setError(error)
            }
        }
    }
    // Firebase signin
    func loginUser() {
        self.isLoading = true
        closeKeyboard()
        Task {
            do {
                try await Auth.auth().signIn(withEmail: email, password: password)
                print("User Found")
                try await fetchUser()
            } catch {
                await setError(error)
            }
        }
    }
    // MARK: Signing user out
    func signOut() {
        try? Auth.auth().signOut()
        logStatus = false
    }
    // MARK: update password
    func updateUserPassword(completion: @escaping (Bool) -> Void) {
        self.isLoading = true
        Task {
            do {
                if password != "" && newpassword != "" {
                    try await Auth.auth().currentUser?.updatePassword(to: newpassword)
                    completion(true)
                }
                self.isLoading = false
            } catch {
                await setError(error)
                completion(false)
            }
        }
    }
    // MARK: deleting user account
    @MainActor
    func deleteAccount() {
        self.isLoading = true
        Task {
            do {
                guard let userUID = Auth.auth().currentUser?.uid else { return }
                // Step 1: First Deleting profile image from storage
                let reference = Storage.storage().reference().child("Profile_Images").child(userUID)
                try await reference.delete()
                // Step 2:  Deleting user document
                try await Firestore.firestore().collection("Users").document(userUID).delete()
                // Step 3:  Deleting auth account
                try await Auth.auth().currentUser?.delete()
                self.logStatus = false
            } catch {
                await setError(error)
            }
        }
    }
    //  MARK: resetpassword user out
    func resetPassword() {
        self.isLoading = true
        Task {
            do {
                try await Auth.auth().sendPasswordReset(withEmail: email)
                showAlertReset = true
                print("Link sent")
            } catch {
                await setError(error)
                self.errString = error.localizedDescription
                showAlertReset = false
            }
        }
    }
    // Updating reauthenticate user
    func reauthenticateWithPassword(password: String, completion: @escaping (Result<Bool,Error>) -> Void) {
        if let user = Auth.auth().currentUser {
            let crediential = EmailAuthProvider.credential(withEmail: user.email ?? "", password: password)
            user.reauthenticate(with: crediential) { _, error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(true))
                }
            }
        }
    }
    
    // Updating User profile picture
    func updateUserProfilePicture() {
        guard let userUID = Auth.auth().currentUser?.uid,
              let imageData = userProfilePicData,
              let newImage = UIImage(data: imageData),
              let compressedImageData = newImage.jpegData(compressionQuality: 0.8) else {
            return
        }
        
        let storageRef = Storage.storage().reference().child("Profile_Images").child(userUID)

        storageRef.putData(compressedImageData, metadata: nil) { (_, error) in
            if let error = error {
                print("Error uploading profile image: \(error)")
                return
            }
            
            storageRef.downloadURL { (url, error) in
                if let error = error {
                    print("Error getting download URL: \(error)")
                    return
                }
                
                if let profileURL = url?.absoluteString {
                    let db = Firestore.firestore()
                    let userRef = db.collection("Users").document(userUID)
                    
                    userRef.updateData(["userProfileURL": profileURL]) { error in
                        if let error = error {
                            print("Error updating user profile picture: \(error)")
                        } else {
                            print("User profile picture updated successfully")
                            // Update the profile picture in the current user object
                            self.myProfile?.userProfileURL = profileURL
                        }
                    }
                }
            }
        }
    }
    // Updating Username
    func updateUsername(newUsername: String) {
        guard let userUID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        let userRef = db.collection("Users").document(userUID)
        
        userRef.updateData(["username": newUsername]) { error in
            if let error = error {
                print("Error updating username: \(error)")
                DispatchQueue.main.async {
                    self.showAlert = true
                    self.showSuccessAlert = false
                    self.alertMessage = "Failed to update username."
                    
                }
            } else {
                print("Username updated successfully")
                // Update the username in the current user object
                self.myProfile?.username = newUsername
                // Clear the username text field
                self.username = ""
                
            }
        }
    }
    // Updating fullname
    func updateFullname(newFullname: String, completion: @escaping (Bool) -> Void) {
        guard let userUID = Auth.auth().currentUser?.uid else {
            completion(false)
            return
        }
        
        let db = Firestore.firestore()
        let userRef = db.collection("Users").document(userUID)
        
        userRef.updateData(["userFullname": newFullname]) { error in
            if let error = error {
                print("Error updating fullname: \(error)")
                DispatchQueue.main.async {
                    self.showAlert = true
                    self.showSuccessAlert = false
                    self.alertMessage = "Failed to update fullname."
                    
                }
                completion(false)
            } else {
                print("Fullname updated successfully")
                // Update the fullname in the current user object
                self.myProfile?.userFullname = newFullname
                // Clear the username text field
                self.fullname = ""
              
                completion(true)
            }
        }
    }
    
    func updateUserData() async throws {
        guard let userUID = Auth.auth().currentUser?.uid else {
            return
        }
        var data = [String: Any]()
        // update fullname if changed
        if !fullname.isEmpty && myProfile?.userFullname != fullname {
            data["fullname"] = fullname
        }
        // update username if changed
        if !username.isEmpty && myProfile?.username != username {
            data["username"] = username
        }
        if !data.isEmpty {
            try await Firestore.firestore().collection("Users").document(userUID).updateData(data)
        }
    }
}
