//
//  ContentView.swift
//  trivia
//
//  Created by Owen Dewing on 4/28/23.
//

import SwiftUI
import Firebase


struct ContentView: View {
    @StateObject var triviaManager = AppManager()
    @AppStorage("log_status") var logStatus: Bool = false
        


    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Trivia Time")
                        .font(.system(size: 35.0).bold())
                }
                
                NavigationLink {
                   GameView()
                        .environmentObject(triviaManager)
                        .environmentObject(TriviaScore())

                } label: {
                    PrimaryButton(text: "Let's go!")
                }
                
                NavigationLink {
                    ScoreManager()
                        .environmentObject(LoginViewModel())
                } label: {
                    PrimaryButton(text: "Top Scores")
                }
                Button("Logout"){
                    try? Auth.auth().signOut()
                    logStatus = false
                }
                .padding(.bottom,-200)
                .padding(.horizontal,0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Game: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
