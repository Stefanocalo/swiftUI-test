//
//  WelcomeView.swift
//  Code History
//
//  Created by Stefano Calò on 26/10/25.
//

import SwiftUI

struct WelcomeView: View {

    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                GameColor.main.ignoresSafeArea()
                VStack {
                    Text("Select the correct answers to the following questions.")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .multilineTextAlignment(.leading)
                    Spacer()
                    NextQuestionButton(selectedItem: "ok", title: "Ok, let's go", action: {path.append("game")})
                }
            }
            .foregroundColor(Color.white)
            .navigationDestination(for: String.self) {element in
                switch element {
                    case "game":
                    GameView()
                    
                    default:
                        Text("Unknown page")
                }
                }
            }
        }
    }

#Preview {
    WelcomeView()
}
