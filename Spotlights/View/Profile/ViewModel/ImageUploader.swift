//
//  ImageUploader.swift
//  Spotlights
//
//  Created by Rueben on 21/05/2023.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/Profile_Images/\(fileName)")
        
        do {
            let _ = try? await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("Debug: Failed to upload image \(error.localizedDescription)")
            return nil
        }
    }
}
