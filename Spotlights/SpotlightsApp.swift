//
//  SpotlightsApp.swift
//  Spotlights
//
//  Created by Rueben on 11/04/2023.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
      return true
  }
}

@main
struct SpotlightsApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            GeometryReader{ proxy in
                Main()
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}
