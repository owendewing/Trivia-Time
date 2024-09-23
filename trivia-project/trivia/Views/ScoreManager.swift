//
//  ScoreManager.swift
//  trivia
//
//  Created by Owen Dewing on 5/1/23.
//

import SwiftUI

struct ScoreManager: View {
    @EnvironmentObject var auth: LoginViewModel
    @State var requestLogin = false

    var body: some View {
        if auth.logStatus {
            ScoreView(scores:[])
                .environmentObject(auth)
                .environmentObject(TriviaScore())
        } else {
            VStack {
                Text("Sorry, looks like we aren’t set up right!")
                    .padding()

                Text("Please contact this app’s developer for assistance.")
                    .padding()
            }
        }
    }
}
