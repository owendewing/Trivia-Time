//
//  QuestionView.swift
//  trivia
//
//  Created by Axel Pestoni on 4/30/23.
//


import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: AppManager

    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Trivia Game")
                
                Spacer()
                
                Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
                
                Spacer()
            }
            
    
            Updater(TimerVar: triviaManager.timer)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(triviaManager.getCurrentTrivia().question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                ForEach(triviaManager.currentAnswers, id: \.id) { answer in
                    AnswerListView(answer: answer)
                        .environmentObject(triviaManager)
                }
            }
            
            Button {
                triviaManager.nextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: triviaManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!triviaManager.answerSelected)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(AppManager())
    }
}
