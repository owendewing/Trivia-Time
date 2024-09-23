//
//  triviaApp.swift
//  trivia
//
//  Created by Owen Dewing on 4/28/23.
//

import SwiftUI
import FirebaseCore
import FirebaseStorage
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
<<<<<<< HEAD
=======

>>>>>>> 4341ba9455ed5db0368fe8816fe0f7224710b5a8
@main
struct triviaApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            transition()
        }
    }
}
