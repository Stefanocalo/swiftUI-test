//
//  NextQuestionButton.swift
//  Code History
//
//  Created by Stefano Calò on 21/09/25.
//

import SwiftUI

struct NextQuestionButton: View {
    var selectedItem: String
    var body: some View {
        Button(action: {print("Pressed!")}, label: {Text("Next question")})
            .frame(maxWidth: .infinity)
            .padding()
            .multilineTextAlignment(.leading)
            .background(selectedItem.isEmpty ? Color.secondary : Color.yellow)
            .fontWeight(.bold)
            .font(.title3)
            .foregroundColor(Color.black)
            .disabled(selectedItem.isEmpty)
    }
}

#Preview {
    NextQuestionButton(selectedItem: "")
}
