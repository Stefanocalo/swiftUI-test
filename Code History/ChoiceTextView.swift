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
    let accentColor = Color(red: 48/255, green: 105/255, blue: 240/255)

    var body: some View {
        Text(choiceText)
            .font(.body)
            .multilineTextAlignment(.trailing)
            .padding(22)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(choiceText == selectedItem ? accentColor : Color.clear)
            .border(accentColor, width: 4)
            .cornerRadius(5)
            .padding(.horizontal)
    }
}

#Preview {
    ChoiceTextView(choiceText: "Moth", selectedItem: "Moth")
}
