//
//  AppManager.swift
//  trivia
//
//  Created by Axel Pestoni on 4/30/23.
//
import Foundation
import SwiftUI
import FirebaseFirestore
import Firebase
class AppManager: ObservableObject {
    
    @Published var answerSelected = false
    @Published var reachedEnd = false
    @Published var resetting = false
    @Published var index = 0
    @Published var score = 0
    @Published var length = 0
    @Published var currentQuestion = ""
    @Published var timer = UpdaterViewModel()
    @Published var trivia: [Question] = []
    @Published var currentAnswers: [Answer] = []

    init() {
        Task.init {
            await fetchTrivia()
        }
    }
    
    func fetchTrivia() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }

            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(Trivia.self, from: data)

            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.reachedEnd = false
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
            }
        } catch {
            print("Error fetching trivia: \(error)")
        }
    }
    
    func getCurrentTrivia() -> Question {
        return trivia[index]
    }
    
    func nextQuestion() {
        if(index+1<length) {
            resetting = true
            index += 1
            setQuestion()
            timer.reset()
            timer.refresh()
            resetting = false
        } else {
            reachedEnd = true
        }
    }
    
    func getTimer() -> UpdaterViewModel {
            return timer
    }
    
    func setQuestion() {
        currentQuestion = trivia[index].question
        currentAnswers = trivia[index].answers
        currentAnswers.shuffle()
        answerSelected = false
    }
    
    func getScore() -> Int {
        return score
    }
    
    func calculateScore() -> Int{
        return Int(50*(timer.getCurrentTime()/10))
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if(answer.isCorrect) {
            let plusScore = calculateScore()
            score += plusScore
        }
    }
}
