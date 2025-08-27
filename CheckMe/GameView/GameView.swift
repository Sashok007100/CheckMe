//
//  GameView.swift
//  CheckMe
//
//  Created by Alexandr Artemov on 27.08.2025.
//

import SwiftUI

struct GameView: View {
    @State private var gameViewModel = GameViewViewModel()
    
    var body: some View {
        VStack {
            GameSliderView(gameViewModel: gameViewModel)
            
            Button("Проверь меня!", action: gameViewModel.showAlert)
                .padding()
                .alert(
                    "Your Score",
                    isPresented: $gameViewModel.alertIsPresented,
                    actions: {}
                ) {
                    Text(gameViewModel.scores.formatted())
                }
            
            Button("Начать заново", action: gameViewModel.reset)
        }
    }
}

#Preview {
    GameView()
}
