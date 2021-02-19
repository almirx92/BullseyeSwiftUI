//
//  ContentView.swift
//  BullseyeSwiftUI
//
//  Created by User on 14. 2. 2021..
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false;
    @State private var sliderValue = 50.0;
    @State private var game = Game();
    
    var body: some View {
        VStack {
            VStack {
                Text("🎯🎯🎯PUT THE BULLSEYE AS CLOSE AS YOU CAN TO").bold()
                    .kerning(4.0)
                    .multilineTextAlignment(.center).lineSpacing(4.0).font(.footnote)
                
                Text(String(game.target))   
                    .kerning(-1)
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                HStack {
                    Text("1")
                        .bold()
                    Slider(value: $sliderValue, in: 1.0...100.0)
                    Text("100")
                        .bold()
                }
                Button(action: {
                    alertIsVisible = true;
                }) {
                    Text("Hit me")
                }.alert(isPresented: $alertIsVisible, content: {
                    let roundedValue = Int(sliderValue.rounded());
                    return Alert(title: Text("Hello there"), message: Text("Your scored \(game.points(sliderValue: roundedValue))"), dismissButton:
                                    .default(Text("Awsome")))
                })
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

