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
    @State private var questionCounter = 1
    
    let question = Question(questionText: "What was the first computer bug?",
                            possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"],
                            correctAnswerIndex: 2)
    
    func getNextQuestion() {
        withAnimation(.smooth) {
            questionCounter += 1
        }
    }
    
    var body: some View {
        

        ZStack {
            mainColor.ignoresSafeArea()
            VStack{
                HStack{
                    Text("\(questionCounter)")
                        .id(questionCounter)
                        .transition(.blurReplace.combined(with: .opacity))
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                        .bold()
                    Text("/  10")
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                        .bold()
                }
                .padding()
                Text(question.questionText)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                HStack{
                    Text("You selected:")
                        .font(.title2)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                    Text("\(selectedItem)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(0)
                        .multilineTextAlignment(.leading)
                        .id(selectedItem)
                        .transition(.scale.combined(with: .blurReplace))
                        .multilineTextAlignment(.leading)
                }
                .padding(.vertical, 30)
                
                Spacer()
                VStack {
                    VStack {
                        ForEach(question.possibleAnswers, id: \.self) { answer in
                            Button(action: {
                                getNextQuestion()
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
                    NextQuestionButton(selectedItem: selectedItem)
                }
                .padding(.top)
                }.foregroundColor(Color.white)
        }
            
    }
}

#Preview {
    ContentView()
}
