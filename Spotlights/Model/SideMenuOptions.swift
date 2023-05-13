//
//  SideMenuOptions.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import Foundation

enum SlideMenuModel: Int, CaseIterable {
    case spotlight
    case contactus
    case about
    case share
    case signout
    var title: String {
        switch self {
        case .spotlight:
            return  "Spotlights"
        case .contactus:
            return  "Contact us"
        case .about:
            return  "About"
        case .share:
            return  "Share"
        case .signout:
            return  "Sign Out"
        }
    }
    var imageName: String {
        switch self {
        case .spotlight:
            return  "Spotlights"
        case .contactus:
            return  "Contact us"
        case .about:
            return  "About"
        case .share:
            return  "Share"
        case .signout:
            return  "Sign Out"
        }
    }
}
enum Tab: String, CaseIterable {
    case dashboard = "smart-home"
    case explore = "spotlightlogo"
    case spotlight = "add-square"
    case profile = "tag-user"
}
enum Category: String, CaseIterable {
    case creator = "Creator"
    case gifters = "Gifters"
}

enum slidemenuModel: String, CaseIterable {
    case spotlight
    case contactus
    case about
    case share
    case signout
    var title: String {
        switch self {
        case .spotlight:
            return  "Get Spotlights"
        case .contactus:
            return  "Contact us"
        case .about:
            return  "About"
        case .share:
            return  "Share"
        case .signout:
            return  "Sign Out"
        }
    }
    var imageName: String {
        switch self {
        case .spotlight:
            return  "Spotlights"
        case .contactus:
            return  "Contact us"
        case .about:
            return  "About"
        case .share:
            return  "Share"
        case .signout:
            return  "Sign Out"
        }
    }
}
