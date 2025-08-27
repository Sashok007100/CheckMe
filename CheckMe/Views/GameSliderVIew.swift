//
//  ContentView.swift
//  CheckMe
//
//  Created by Alexandr Artemov (Mac Mini) on 18.08.2025.
//

import SwiftUI

struct GameSliderView: View {
    @Bindable var gameViewModel: GameViewViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            let targetValue = gameViewModel.gameOptions.targetValue
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            
            HStack{
                Text("0")
                UISliderRepresentable(
                    currentValue: $gameViewModel.gameOptions.currentValue,
                    alpha: gameViewModel.alpha
                )
                Text("100")
            }
        }
        .padding()
    }
}

#Preview {
    GameSliderView(gameViewModel: GameViewViewModel())
}
