//
//  ExploreViewModel.swift
//  Spotlights
//
//  Created by Rueben on 14/04/2023.
//

import Foundation
import UIKit

class ExploreViewModel: ObservableObject {
    @Published var selectedCategory: Category = .gifters
    @Published var socialMedia = SocialMedia(tiktok: "", facebook: "", twitter: "", instagram: "")
    // Opening tiktok profile
    func openTikTokProfile() {
        if let tiktokURL = URL(string: "https://www.tiktok.com/@\(socialMedia.tiktok)") {
            UIApplication.shared.open(tiktokURL)
        }
    }
    // Opening facebook profile
    func openFacebookProfile() {
        if let facebookURL = URL(string: "https://www.facebook.com/@\(socialMedia.facebook)") {
            UIApplication.shared.open(facebookURL)
        }
    }
    // Opening twiter profile
    func openTwitterProfile() {
        if let twiterURL = URL(string: "https://www.twitter.com/@\(socialMedia.twitter)") {
            UIApplication.shared.open(twiterURL)
        }
    }
    // Opening instagram profile
    func openInstagramProfile() {
        if let instagramURL = URL(string: "https://www.instagram.com/@\(socialMedia.instagram)") {
            UIApplication.shared.open(instagramURL)
        }
    }
}

// Social media model
struct SocialMedia {
    var tiktok: String
    var facebook: String
    var twitter: String
    var instagram: String
}
