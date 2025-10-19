//
//  Game.swift
//  Code History
//
//  Created by Stefano Calò on 19/10/25.
//

import Foundation

struct Game {
    private let questions = Question.allQuestions.shuffled()
    
    private(set) var guesses = [Question: Int]()
    private(set) var currentQuestionIndex: Int = 0
    private(set) var isOver : Bool = false
    private(set) var passingScore: Int = 70
    
    mutating func updateGameStatus() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            isOver = true
        }
    }
    
    mutating func makeGuessForCurrentQuestion(atIndex index: Int) {
        guesses[questions[currentQuestionIndex]] = index
    }
    
    mutating func updatePassingScore(to newScore: Int) {
        passingScore = newScore
    }
    
    func currentQuestion() -> Question {
        questions[currentQuestionIndex]
    }
    
    func totalQuestions() -> Int {
        questions.count
    }
    
    func currentIndex() -> Int {
        currentQuestionIndex
    }
    
    func guesscount() -> (correct: Int, incorrect: Int) {
        var count: (correct: Int, incorrect: Int) = (0,0)
        print(guesses)
        for (question, indexGuessed) in guesses {
            if question.correctAnswerIndex == indexGuessed {
                count.correct += 1
            } else {
                count.incorrect += 1
            }
        }
        return count
    }
    
    func guessedPercentage() -> Int {
        let count = guesscount()
        let total = count.correct + count.incorrect
        guard total > 0 else { return 0 } // avoid division by zero
        let percentage = (Double(count.correct) / Double(total)) * 100
        return Int(percentage.rounded())
    }
    
    func hasWonGame() -> Bool {
        guessedPercentage() >= passingScore
    }
 }
