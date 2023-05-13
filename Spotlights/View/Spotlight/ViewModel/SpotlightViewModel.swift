//
//  SpotlightViewModel.swift
//  Spotlights
//
//  Created by Rueben on 13/04/2023.
//

import Foundation
import UIKit
import Firebase

class SpotlightViewModel: ObservableObject {
    @Published var isButton1Selected = false
    @Published var isButton2Selected = false
    @Published var isView1Visible = false
    @Published var blog = ""
    @Published var projects = ""
    @Published var amount = ""
    @Published var amountGifter = ""
    @Published var tiktok = ""
    @Published var twitter = ""
    @Published var instagram = ""
    @Published var facebook = ""
    @Published var showSlideMenu = false
    
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
    
}
