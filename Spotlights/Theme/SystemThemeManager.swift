//
//  SystemThemeManager.swift
//  YumYum
//
//  Created by Rueben on 24/03/2023.
//

import Foundation
import UIKit


class SystemThemeManager {
    
    static let shared = SystemThemeManager()
    
    private init() {}
    
    func handleTheme(darkMode: Bool, system: Bool) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() +  0.25) {
            guard !system else {
                // Handle system
                UIApplication.keyWindow?.overrideUserInterfaceStyle = .unspecified
                return
            }
            // Handle toggle
            UIApplication.keyWindow?.overrideUserInterfaceStyle = darkMode ? .dark : .light
        }
        
    }
}


extension UIApplication {
    
    static var keyWindow: UIWindow? {
        // Get connected scenes
        return UIApplication.shared.connectedScenes
            // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
    
}
