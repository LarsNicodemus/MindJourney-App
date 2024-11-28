//
//  ColorPickView.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 26.11.24.
//

import SwiftUI

struct ColorPickView: View {
    
    

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
        }
    }
}


//import SwiftUI
//
//struct ColorPickView: View {
//    
//    let radius: CGFloat = 150
//    var diameter: CGFloat {
//        radius * 2
//    }
//
//    @State private var startLocation: CGPoint?
//    @State private var location: CGPoint?
//    @State private var isCircleVisible: Bool = false
//    @State private var isSheetPresented: Bool = false
//    @Binding var bgColor: Color
//    
//    var body: some View {
//        VStack {
//            Button("Farbe wählen") {
//                isSheetPresented = true
//            }
//            .bold()
//            .buttonStyle(.borderedProminent)
//            .tint(bgColor)
//            .padding()
//            
//            
//            RoundedRectangle(cornerRadius: 10)
//                .fill(bgColor)
//                .frame(width: 300, height: 150)
//                .overlay(
//                    Text("Aktuelle Hintergrund Farbe")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                )
//        }
//        
//        .sheet(isPresented: $isSheetPresented) {
//            VStack {
//                
//                Text("Wähle eine Farbe")
//                    .font(.title)
//                    .padding()
//                
//                ZStack {
//                    VStack {
//                        Button("Farbe wählen") {
//                            startLocation = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
//                            location = startLocation
//                            isCircleVisible = true
//                        }
//                        .bold()
//                        .buttonStyle(.borderedProminent)
//                        .tint(bgColor)
//                        Button("Ausgewählte Farbe speichern") {
//                            isSheetPresented = false
//                        }
//                        .bold()
//                        .buttonStyle(.borderedProminent)
//                        .tint(.blue)
//                        .padding()
//                    }
//                    CircleView(isCircleVisible: $isCircleVisible, startLocation: $startLocation, location: $location, diameter: diameter, radius: radius, bgColor: $bgColor)
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background(isCircleVisible ? bgColor : Color.clear)
//                .gesture(colorPickerDragGesture(
//                    startLocation: $startLocation,
//                    location: $location,
//                    isCircleVisible: $isCircleVisible,
//                    bgColor: $bgColor,
//                    radius: radius
//                ))
//                
//                
//                
//            }
//            .presentationDetents([.medium,.large])
//        }
//    }
//    
//    
//}
