//
//  ContentView.swift
//  Code History
//
//  Created by Stefano Calò on 29/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.blue)
                .multilineTextAlignment(.center)
                .padding(.bottom)
                
                
            Text("I am a new app.")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
