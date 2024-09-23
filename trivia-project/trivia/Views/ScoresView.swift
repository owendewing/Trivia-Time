//
//  ScoresView.swift
//  trivia
//
//  Created by Owen Dewing on 5/1/23.
//

/**
 * ArticleList displays a list of articles, toggling between the list and a chosen article.
 */
import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var auth: LoginViewModel
    @EnvironmentObject var articleService: TriviaScore
    
    @State var scores: [ScoreModel]
    @State var error: Error?
    @State var fetching = false
    @State var writing = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Leaderboard")
                    .font(.system(size: 45.0).bold())
                    .foregroundColor(.blue)
                if fetching {
                    ProgressView()
                } else if error != nil {
                    Text("Error" + "\(String(describing: error))")
                } else if scores.count == 0 {
                    VStack {
                        Spacer()
                        Text("There are no scores.")
                        Spacer()
                    }
                } else {
                    List(scores) { score in
                            ScoresDataView(score: score)
                    }
                }
            }
        }
        .task {
            fetching = true
            do {
                scores = try await articleService.fetchScores()
                fetching = false
            } catch {
                self.error = error
                fetching = false
            }
        }
    }
}
