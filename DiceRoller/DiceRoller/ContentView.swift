//
//  ContentView.swift
//  DiceRoller
//
//  Created by Francisco Totaro on 19/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfDice: Int = 1
    
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundStyle(.white)
            
            HStack{
                ForEach(1...numberOfDice, id: \.description){ _ in
                    DiceView()
                }
            }
            
            HStack{
                Button("Remove Dice", systemImage: "minus.circle.fill"){
                    withAnimation(){
                        numberOfDice -= 1
                    }
                }
                .disabled(numberOfDice == 1)
                .labelStyle(.iconOnly)
                .font(.title)
                
                Button("Add Dice", systemImage: "plus.circle.fill"){
                    withAnimation(){
                        numberOfDice += 1
                    }
                }
                .disabled(numberOfDice == 5)
                .labelStyle(.iconOnly)
                .font(.title)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackground)
        .tint(.white)
    }
}

#Preview {
    ContentView()
}
