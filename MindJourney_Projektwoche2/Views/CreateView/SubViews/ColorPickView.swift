//
//  ColorPickView.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 26.11.24.
//

import SwiftUI

struct ColorPickView: View {
    
    let radius: CGFloat = 150
        var diameter: CGFloat {
            radius * 2
        }

    @Binding var startLocation: CGPoint?
    @Binding var location: CGPoint?
    @Binding var isCircleVisible: Bool
    @Binding var bgColor: Color
    
    var body: some View {
        VStack {
            Button("Farbe für dein Stimmung auswählen") {
                startLocation = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
                location = startLocation
                isCircleVisible = true
            }
            .bold()
            .buttonStyle(.borderedProminent)
            .tint(bgColor)
            .gesture(colorPickerDragGesture(
                          startLocation: $startLocation,
                          location: $location,
                          isCircleVisible: $isCircleVisible,
                          bgColor: $bgColor,
                          radius: radius
                      ))
        }
    }
}



