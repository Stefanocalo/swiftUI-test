//
//  ChoiceTextView.swift
//  Code History
//
//  Created by Stefano Calò on 20/09/25.
//

import SwiftUI


struct ChoiceTextView: View {
    
    let choiceText: String
    let selectedItem: String

    var body: some View {
        Text(choiceText)
            .font(.body)
            .multilineTextAlignment(.trailing)
            .padding(22)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(choiceText == selectedItem ? GameColor.accent : Color.clear)
            .border(GameColor.accent, width: 4)
            .cornerRadius(5)
            .padding(.horizontal)
    }
}

#Preview {
    ChoiceTextView(choiceText: "Fly", selectedItem: "Fly")
}
