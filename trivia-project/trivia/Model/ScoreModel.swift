//
//  ScoreModel.swift
//  trivia
//
//  Created by Owen Dewing on 5/1/23.
//

struct ScoreModel: Hashable, Codable, Identifiable  {
    var id: String
    var maxScore: Int
}
