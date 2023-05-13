//
//  HapticManager.swift
//  Spotlights
//
//  Created by Rueben on 13/04/2023.
//

import Foundation
import SwiftUI

class  HapticManager {
    static let instance =  HapticManager() // Singleton
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
