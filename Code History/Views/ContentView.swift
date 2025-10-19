//
//  ContentView.swift
//  Code History
//
//  Created by Stefano Calò on 29/06/25.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @State private var dictionary = ["Jason": 10, "Paul": 22]
    @State private var selectedItem: String = ""
    @State private var mainColor = Color(red: 20/255, green: 28/255, blue: 58/255)
    @State private var game = Game()
    
    var body: some View {
        

        ZStack {
            mainColor.ignoresSafeArea()
            VStack{
                HStack {
                    Text("\(game.currentQuestionIndex + 1)")
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                        .bold()
                        .contentTransition(.numericText(value: Double(game.currentQuestionIndex + 1)))
                        .animation(.bouncy, value: game.currentQuestionIndex)
                    Text("/  \(game.totalQuestions())")
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                        .bold()
                }
                .padding()
                Text(game.currentQuestion().questionText)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                    .padding(10)
                    .multilineTextAlignment(.leading)
                    .contentTransition(.opacity)
                    .animation(.smooth, value: game.currentQuestion().questionText)
                HStack{
                    Text("\(selectedItem)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .multilineTextAlignment(.leading)
                        .id(selectedItem)
                        .transition(.scale.combined(with: .blurReplace))
                        .multilineTextAlignment(.leading)
                }
                .padding(.vertical, 30)
                
                Spacer()
                VStack {
                    VStack {
                        ForEach(game.currentQuestion().possibleAnswers, id: \.self) { answer in
                            Button(action: {
                                print("Tapped on option with the text: \(answer)")
                                withAnimation(.bouncy) {
                                    selectedItem = answer
//                                    mainColor = answer == question.possibleAnswers[question.correctAnswerIndex] ? .green : .red
                                }
                            }, label: {
                                ChoiceTextView(choiceText: answer, selectedItem: selectedItem)
                            })
                            .disabled(selectedItem == answer)
                            .frame(maxWidth: .infinity)

                        }
                    }
                    .frame(maxWidth: .infinity)

                }
                .frame(maxWidth: .infinity)
                VStack {
                    NextQuestionButton(selectedItem: selectedItem, action: {
                        let selectedIndex = game.currentQuestion().possibleAnswers.firstIndex(of: selectedItem)!
                        game.makeGuessForCurrentQuestion(atIndex: selectedIndex)
                        game.updateGameStatus()
                        selectedItem = ""
                        if game.isOver {
                            print(game.hasWonGame())
                            print(game.guessedPercentage())
                        }
                    })
                }
                .padding(.top)
                }.foregroundColor(Color.white)
        }
            
    }
}

#Preview {
    ContentView()
}
