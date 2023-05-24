//
//  saveToDocumentDirectory.swift
//  Spotlights
//
//  Created by Rueben on 24/05/2023.
//

import Foundation
import UIKit

extension UIImage {
    func saveImageToDocumentDirectory() -> String? {
        guard let data = self.jpegData(compressionQuality: 0.8),
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
