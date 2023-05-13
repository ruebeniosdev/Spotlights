//
//  CreatorsModel.swift
//  Spotlights
//
//  Created by Rueben on 02/05/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

// MARK: Creator Model
struct CreatorModel: Identifiable, Codable {
    @DocumentID var id: String?
    var blogURL: String
    var selectedOption: String
    var imageURL: URL?
    enum CodingKeys: CodingKey {
        case id
        case blogURL
        case selectedOption
        case imageURL
    }
}
