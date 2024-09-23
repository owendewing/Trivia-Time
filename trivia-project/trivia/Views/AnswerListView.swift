//
//  AnswerListView.swift
//  trivia
//
//  Created by Axel Pestoni on 4/30/23.
//


import SwiftUI

struct AnswerListView: View {
    @EnvironmentObject var manager: AppManager
    var answer: Answer
    @State private var selected = false
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .bold()
            
            if selected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? green : red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor((selected ? Color("AccentColor") : .gray))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: selected ? answer.isCorrect ? green : red : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !manager.answerSelected {
                selected = true
                manager.selectAnswer(answer: answer)

            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerListView(answer: Answer(text: "Single", isCorrect:  true))
            .environmentObject(AppManager())
    }
}
