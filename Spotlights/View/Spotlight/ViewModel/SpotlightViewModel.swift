//
//  SpotlightViewModel.swift
//  Spotlights
//
//  Created by Rueben on 13/04/2023.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage

class SpotlightViewModel: ObservableObject {
    @Published var isButton1Selected = false
    @Published var isButton2Selected = false
    @Published var isView1Visible = false
    @Published var blog = ""
    @Published var projects = "Select which projects to support"
    @Published var amount = ""
    @Published var amountGifter = ""
    @Published var tiktok = ""
    @Published var twitter = ""
    @Published var instagram = ""
    @Published var facebook = ""
    @Published var showSlideMenu = false
    @Published var showOptions = false
    var options = ["Orphanage", "Business", "School", "Hospitality"]
    private let db = Firestore.firestore()
    private let  optionsCollection = "spotlight_options"
    
    
    
    
    // Opening tiktok profile
    func openTikTokProfile() {
        if let tiktokURL = URL(string: "https://www.tiktok.com/@\(tiktok)") {
            UIApplication.shared.open(tiktokURL)
        }
    }
    
    // Opening twiter profile
    func openTwitterProfile() {
        if let twiterURL = URL(string: "https://www.twitter.com/@\(twitter)") {
            UIApplication.shared.open(twiterURL)
        }
    }
    
    // Opening instagram profile
    func openInstagramProfile() {
        if let instagramURL = URL(string: "https://www.instagram.com/@\(instagram)") {
            UIApplication.shared.open(instagramURL)
        }
    }
    
    // Opening facebook profile
    func openFacebookProfile() {
        if let facebookURL = URL(string: "https://www.facebook.com/@\(facebook)") {
            UIApplication.shared.open(facebookURL)
        }
    }
    
    func closeKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    // Saving options to Firebase
    func  saveOptions() {
        let options = self.options.map { CreatorModel(id: UUID().uuidString, blogURL: blog, option: $0) }
        // Convert options to dictionary for Firebase
        var optionsDict: [String: Any] = [:]
        for option in options {
            optionsDict[option.id!] = [
                "option": option.option
            ]
        }
        
        db.collection(optionsCollection).addDocument(data: optionsDict) { error in
            if let error = error {
                print("Error saving options: \(error.localizedDescription)")
            } else {
                print("Options saved successfully")
            }
        }
    }
    // Loading options from Firebase
    func loadOptions() {
           db.collection(optionsCollection).getDocuments { snapshot, error in
               if let error = error {
                   print("Error loading options: \(error.localizedDescription)")
                   return
               }
               
               guard let snapshot = snapshot else { return }
               
               var loadedOptions: [String] = []
               
               for document in snapshot.documents {
                   if let optionData = document.data()["option"] as? String {
                       loadedOptions.append(optionData)
                   }
               }
               
               DispatchQueue.main.async {
                   self.options = loadedOptions
               }
           }
       }
    
}
