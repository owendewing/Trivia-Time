//
//  ScoresDataView.swift
//  trivia
//
//  Created by Owen Dewing on 5/1/23.
//

import SwiftUI

struct ScoresDataView: View {
    var score: ScoreModel

    var body: some View {
        HStack() {
            Label("", systemImage: "trophy")
            
            Text(score.id)
                .font(.headline)

            Spacer()

            VStack(alignment: .trailing) {
                Text(String(score.maxScore))
                    .font(.caption)
            }
        }
    }
}

struct ScoresDataView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresDataView(score:ScoreModel(id:"AXELPESTONI",maxScore:30000))
    }
}
