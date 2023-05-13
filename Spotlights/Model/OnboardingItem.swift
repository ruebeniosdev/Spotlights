//
//  OnboardingItem.swift
//  Spotlights
//
//  Created by Rueben on 13/04/2023.
//

import Foundation

struct OnboardingItem: Identifiable {
    var id = UUID()
    var imageUrl: String
    var title: String
    var subTitle: String
}

var onboardingItems = [
    OnboardingItem(imageUrl: "onboard1", title: "Stand out from\nthe crowd", subTitle: "Try our special spotlight feature and\ndrive more engagements across your social media pages."),
    OnboardingItem(imageUrl: "onboard2", title: "Become\nan influencer", subTitle: "Support project Nhyira and the core team of Nhyira Foundation to receive awesome perks"),
    OnboardingItem(imageUrl: "onboard3", title: "Connect with\nfollowers", subTitle: "Grab Gifters, connect with friends and celebrate milestones with your fanbase.")
]
