//
//  ImagePickerViewModel.swift
//  ImagePicker
//
//  Created by Satyadev Chauhan on 21/02/21.
//

import SwiftUI


final class ImagePickerViewModel: ObservableObject {
    @Published var loginStatusMessage: String = ""
    @Published var selectedImage: UIImage?
    @Published var isPresentingImagePicker = false
    
    private(set) var sourceType: ImagePickerView.SourceType = .camera
    
    func choosePhoto() {
        sourceType = .photoLibrary
        isPresentingImagePicker = true
    }
    
    func takePhoto() {
        sourceType = .camera
        isPresentingImagePicker = true
    }
    
    func didSelectImage(_ image: UIImage?) {
        selectedImage = image
        isPresentingImagePicker = false
    }
     
}
