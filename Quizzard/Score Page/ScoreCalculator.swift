//
//  ScoreCalculator.swift
//  Quizzard
//
//  Created by Tom Wojcik on 24/06/2019.
//  Copyright © 2019 Tom Wojcik. All rights reserved.
//

import Foundation

struct ScoreViewData {
    let amountMessage: String
    let percentage: Float
    let scoreMessage: String
}

class ScoreCalculator {
    
    let score: Score
    
    init(score: Score) {
        self.score = score
    }
    
    private func totalNumberOfQuestions() -> Int {
        return score.quiz.questions.count
    }
    
    func numberOfCorrectAnswers() -> Int {
        var correctAnswers: Int = 0
        for question in score.quiz.questions {
            let userAnswer = score.userAnswers[question]
            if question.answer == userAnswer {
                correctAnswers += 1
            }
        }
        
        return correctAnswers
    }
    
    private func calculateAmountMessage() -> String {
        
        let totalQuestions = totalNumberOfQuestions()
        let correctAnswers = numberOfCorrectAnswers()
        
        let amountMessage = "\(correctAnswers) / \(totalQuestions) correct"
        return amountMessage
    }
    
    private func calculatePercentage() -> Float {
        
        let totalQuestions = totalNumberOfQuestions()
        let correctAnswers = numberOfCorrectAnswers()
        
        return Float(correctAnswers) / Float(totalQuestions)
    }
    
    private func createScoreMessage() -> String {
        let percentage = calculatePercentage()
        
        if percentage >= 1 {
            return "You got a perfect score!"
        } else if percentage >= 0.5 {
            return "Well done"
        } else {
            return "Bad luck"
        }
    }
    
    func scoreViewData() -> ScoreViewData {
        
        let amountMessage = calculateAmountMessage()
        let percentage = calculatePercentage()
        let scoreMessage = createScoreMessage()
        
        return ScoreViewData(amountMessage: amountMessage,
                             percentage: percentage,
                             scoreMessage: scoreMessage)
    }
}
