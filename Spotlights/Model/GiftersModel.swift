//
//  GiftersModel.swift
//  Spotlights
//
//  Created by Rueben on 12/04/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct GiftersModel: Identifiable, Codable {
    @DocumentID var id: String?
    var userProfileURL: URL
    var userName: String
    var tiktok: String
    var twitter: String
    var instagram: String
    var facebook: String
    var imageReferenceID: String = ""
    var userUID: String
    var verified: String
    var popular: String
    var userCount: Int
    var giftsGiven: Int
    var stars: Int
    var tiktokGrabs: Int
    enum CodingKeys: CodingKey {
        case userProfileURL
        case userName
        case tiktok
        case twitter
        case instagram
        case facebook
        case imageReferenceID
        case userUID
        case verified
        case popular
        case userCount
        case giftsGiven
        case stars
        case tiktokGrabs
    }
}
