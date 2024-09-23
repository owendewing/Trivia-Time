//
//  Trivia.swift
//  trivia
//
//  Created by Axel Pestoni on 4/30/23.
//

import Foundation

struct Trivia: Decodable {
    var results: [Question]
}

struct Question: Decodable, Identifiable {
    var id: UUID {
        UUID()
    }
    var category: String
    var type: String
    var difficulty: String
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
    
    var answers: [Answer] {
        let correct_answer = [Answer(text: correct_answer, isCorrect: true)]
        let incorrect_answers = incorrect_answers.map { answer in
            Answer(text: answer, isCorrect: false)
        }

        let allAnswers = correct_answer + incorrect_answers
        return allAnswers
    }
}
