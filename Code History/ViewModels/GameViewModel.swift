//
//  GameViewModel.swift
//  Code History
//
//  Created by Stefano Calò on 01/11/25.
//

import Foundation

class GameViewModel : ObservableObject {
    @Published private var game = Game()
    
    var currentQuestion : Question {
        game.currentQuestion()
    }
    
    var currentQuestionIndex : Int {
        game.currentQuestionIndex
    }
    
    var totalQuestions: Int {
        game.totalQuestions()
    }
    
    var isOver: Bool {
        game.isOver
    }
    
    var hasWonGame : Bool {
        game.hasWonGame()
    }
    
    var guessPecentage : Int {
        game.guessedPercentage()
    }
    
    func makeGuess (forIndex index: Int) {
        game.makeGuessForCurrentQuestion(atIndex: index)
    }
    
    func updateGameStatus() {
        game.updateGameStatus()
    }
}
