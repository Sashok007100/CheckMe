//
//  ContentView.swift
//  CheckMe
//
//  Created by Alexandr Artemov (Mac Mini) on 18.08.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 50.0
    @State private var showAlert = false
    @State private var score = 0
    
    private var currentAlpha: CGFloat {
        CGFloat(computeScore()) / 100.0
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            
            HStack{
                Text("0")
                UISliderRepresentable(
                    currentValue: $currentValue,
                    alpha: currentAlpha
                )
                Text("100")
            }
            
            Button("Проверь меня!") {
                score = computeScore()
                showAlert = true
            }
            
            Button("Начать заново") {
                randomTargetValue()
            }
        }
        .padding()
        .alert("Your Score", isPresented: $showAlert) {
                Button("OK") {}
            } message: {
                Text("\(score)")
            }

    }
    
    private func randomTargetValue() {
        targetValue = Int.random(in: 0...100)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
