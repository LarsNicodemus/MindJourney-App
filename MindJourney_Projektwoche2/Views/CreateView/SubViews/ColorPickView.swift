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

    @State private var startLocation: CGPoint?
    @State private var location: CGPoint?
    @State private var isCircleVisible: Bool = false
    @Binding var bgColor: Color
    
    var body: some View {
          ZStack {
              VStack {
                  Button("Farbe wählen") {
                      startLocation = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
                      location = startLocation
                      isCircleVisible = true
                  }
                  .bold()
                  .buttonStyle(.borderedProminent)
                  .tint(bgColor)
              }
              CircleView(isCircleVisible: $isCircleVisible, startLocation: $startLocation, location: $location, diameter: diameter, radius: radius, bgColor: $bgColor)
          }
          .gesture(colorPickerDragGesture(
              startLocation: $startLocation,
              location: $location,
              isCircleVisible: $isCircleVisible,
              bgColor: $bgColor,
              radius: radius
          ))
      }
  }


