//
//  AnimatedBackgroundView.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 28.11.24.
//

import SwiftUI

struct AnimatedBackgroundModifierView: ViewModifier {
    
    @State private var animateBackground = false
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                LinearGradient(
                    colors: [
                        .backgroundBlue,
                        .backgroundGreen,
                        .backgroundBeige,
                        .backgroundPink
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea(.all)
                .hueRotation(.degrees(animateBackground ? 45: 0))
                .onAppear{
                    withAnimation(
                        .easeInOut(duration: 2)
                        .repeatForever(autoreverses: true)) {
                            animateBackground = true
                        }
                }
            }
    }
}

extension View {
    func animatedBackground() -> some View {
        self.modifier(AnimatedBackgroundModifierView())
    }
}
