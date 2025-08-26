//
//  ContentView.swift
//  Code History
//
//  Created by Stefano Calò on 29/06/25.
//

import SwiftUI

struct ContentView: View {
    
    let mainColor = Color(red: 20/255, green: 28/255, blue: 58/255)
    let accentColor = Color(red: 48/255, green: 105/255, blue: 240/255)
    
    var body: some View {
        ZStack {
            mainColor.ignoresSafeArea()
            VStack{
                Text("1/10")
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .bold()
                    .padding()
                Text("What was the first computer bug?")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                Spacer()
                HStack{
                    
                    Button(action: {
                        print("Tapped on item 1")
                    }, label: {Text("Ant")} )
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                    .border(accentColor, width: 4)
                    
                    Button(action: {
                        print("Tapped on item 2")
                    }, label: {Text("Beetle")})
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                    .border(accentColor, width: 4)
                    
                    Button(action: {
                        print("Tapped on item 3")
                    }, label: {Text("Moth")})
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                    .border(accentColor, width: 4)
                    
                    Button(action: {
                        print("Tapped on item 4")
                    }, label: {Text("Fly")})
                    .multilineTextAlignment(.center)
                    .padding()
                    .border(accentColor, width: 4)
                    
                }
            }
            .foregroundColor(Color.white)
        }
            
    }
}

#Preview {
    ContentView()
}
