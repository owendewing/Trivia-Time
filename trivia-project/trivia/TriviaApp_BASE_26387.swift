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
//      let storage = Storage.storage()
//      let storageRef = storage.reference()
//      let db = Firestore.firestore()
    return true
  }
}
//leaderboard collection with player and score
//model object representing score
//2 functions, one for adding score and one for retrieving score
//query with the user ID of the email
//use the wherefield function
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
