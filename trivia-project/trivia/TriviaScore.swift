//
//  TriviaScore.swift
//  trivia
//
//  Created by Owen Dewing on 5/1/23.
//

import Foundation

import Firebase

let COLLECTION_NAME = "leaderboard"
let PAGE_LIMIT = 20

enum ArticleServiceError: Error {
    case mismatchedDocumentError
    case unexpectedError
}

class TriviaScore: ObservableObject {
    private let db = Firestore.firestore()
    @Published var error: Error?
    
    func addScore(score: ScoreModel) -> String {
        var ref: DocumentReference? = nil
        
        ref = db.collection(COLLECTION_NAME).addDocument(data: [
            "user":score.id,
            "score":score.maxScore
        ]) {possibleError in
            if let actualError = possibleError {
                self.error = actualError
            }
        }
        return ref?.documentID ?? ""
    }
    
    func fetchScores() async throws -> [ScoreModel] {
        let scoreQuery = db.collection(COLLECTION_NAME)
            .order(by: "score", descending: true)
            .limit(to: PAGE_LIMIT)
        let querySnapshot = try await scoreQuery.getDocuments()
        return try querySnapshot.documents.map {
            guard let score = $0.get("score") as? Int else{
                throw ArticleServiceError.mismatchedDocumentError}
            guard let id = $0.get("user") as? String else{
                throw ArticleServiceError.mismatchedDocumentError}
            return ScoreModel(id: id, maxScore: score)
        }
    }
}
