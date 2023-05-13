//
//  User.swift
//  Spotlights
//
//  Created by Rueben on 16/04/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var username: String
    var userFullname: String
    var userEmail: String
    var userProfileURL: String
    
    enum CodingKeys: CodingKey {
        case id
        case username
        case userFullname
        case userEmail
        case userProfileURL
    }
}
