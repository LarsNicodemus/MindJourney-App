//
//  CircleView.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 26.11.24.
//

import SwiftUI

struct CircleView: View {
    @Binding var isCircleVisible: Bool
    @Binding var startLocation: CGPoint?
    @Binding var location: CGPoint?
    let diameter: CGFloat
    let radius: CGFloat
    @Binding var bgColor: Color

    var body: some View {
        if isCircleVisible, let startLocation = startLocation {
            ZStack {
                Circle()
                    .fill(
                        AngularGradient(gradient: Gradient(colors: [
                            Color(hue: 1.0, saturation: 1, brightness: 1),
                            Color(hue: 0.9, saturation: 1, brightness: 1),
                            Color(hue: 0.8, saturation: 1, brightness: 1),
                            Color(hue: 0.7, saturation: 1, brightness: 1),
                            Color(hue: 0.6, saturation: 1, brightness: 1),
                            Color(hue: 0.5, saturation: 1, brightness: 1),
                            Color(hue: 0.4, saturation: 1, brightness: 1),
                            Color(hue: 0.3, saturation: 1, brightness: 1),
                            Color(hue: 0.2, saturation: 1, brightness: 1),
                            Color(hue: 0.1, saturation: 1, brightness: 1),
                            Color(hue: 0.0, saturation: 1, brightness: 1)
                        ]), center: .center)
                    )
                    .frame(width: diameter, height: diameter)
                    .overlay(
                        Circle()
                            .fill(
                                RadialGradient(
                                                                    gradient: Gradient(colors: [
                                                                        Color.white,
                                                                        Color.white,
                                                                        Color.white.opacity(0.000001),
                                                                        Color.white.opacity(0.000001),
                                                                        Color.white.opacity(0.000001),
                                                                        Color.white.opacity(0.0000001)
                                                                    ]),
                                                                    center: .center,
                                                                    startRadius: 0,
                                                                    endRadius: radius / 6
                                                                )
                                                            )
                            .stroke(.black, lineWidth: 0.5)
                    )
                    .position(startLocation)
                    .shadow(color: Color.black.opacity(0.1), radius: 6, y: 8)
                
                Circle()
                    .frame(width: 30, height: 30)
                    .overlay(
                        Circle()
                            .stroke(.black, lineWidth: 0.5)
                    )
                    .position(location ?? startLocation)
                
                    .foregroundColor(bgColor.opacity(0.7))
                    
            }
        }
    }
}
