//
//  UISliderRepresentable.swift
//  CheckMe
//
//  Created by Alexandr Artemov (Mac Mini) on 18.08.2025.
//

import SwiftUI

struct UISliderRepresentable: UIViewRepresentable {
    @Binding var currentValue: Double
    @Binding var targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        
        let score = computeScore()
        
        let alpha = CGFloat(score) / 100.0
        
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension UISliderRepresentable {
    final class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

#Preview {
    UISliderRepresentable(currentValue: .constant(50), targetValue: .constant(100))
}
