//
//  GameView.swift
//  trivia
//
//  Created by Axel Pestoni on 4/30/23.
//
import Foundation
import SwiftUI
struct GameView: View {
    @EnvironmentObject var triviaManager: AppManager
    @EnvironmentObject var scores: TriviaScore
    @State private var username: String = ""
    @State private var sent: Bool = false
    
    var body: some View {
        if triviaManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Trivia Game")
                Text("You scored \(triviaManager.score)")
                    .foregroundColor(.black)
                
                
                Button {
                    Task.init {
                        await triviaManager.fetchTrivia()
                    }
                } label: {
                    Text("Play Again")
                }
                .foregroundColor(.black)

                
                TextField("UserName", text: $username)
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 8)
                            .fill(
                                username == "" ? Color.black.opacity(0.05) : Color("Green")
                            )
                    }
                    .foregroundColor(.black)
                    .textInputAutocapitalization(.never)
                    .padding(.top, 20)
                
                Button {
                    Task.init {
                        if(!sent) {
                            scores.addScore(score:ScoreModel(id:username, maxScore: triviaManager.score))
                            sent = true
                        }
                    }
                } label: {
                    Text("Send Score")
                }
                .foregroundColor(.black)

            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}
