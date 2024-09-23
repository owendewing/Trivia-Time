//
//  AnswerModel.swift
//  trivia
//
//  Created by Axel Pestoni on 4/30/23.
//
import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: String
    var isCorrect: Bool
}
