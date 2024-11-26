//
//  ViewExtension.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 26.11.24.
//

import SwiftUI

extension View {
    func colorPickerDragGesture(
        startLocation: Binding<CGPoint?>,
        location: Binding<CGPoint?>,
        isCircleVisible: Binding<Bool>,
        bgColor: Binding<Color>,
        radius: CGFloat
    ) -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { val in
                guard let startLocation = startLocation.wrappedValue else { return }
                let distanceX = val.location.x - startLocation.x
                let distanceY = val.location.y - startLocation.y
                let dir = CGPoint(x: distanceX, y: distanceY)
                var distance = sqrt(distanceX * distanceX + distanceY * distanceY)
                
                if distance < radius {
                    location.wrappedValue = val.location
                } else {
                    let clampedX = dir.x / distance * radius
                    let clampedY = dir.y / distance * radius
                    location.wrappedValue = CGPoint(x: startLocation.x + clampedX, y: startLocation.y + clampedY)
                    distance = radius
                }
                
                if distance == 0 { return }
                
                var angle = Angle(radians: -Double(atan(dir.y / dir.x)))
                if dir.x < 0 {
                    angle.degrees += 180
                } else if dir.x > 0 && dir.y > 0 {
                    angle.degrees += 360
                }
                
                let hue = angle.degrees / 360
                let saturation = Double(distance / radius)
                bgColor.wrappedValue = Color(hue: hue, saturation: saturation, brightness: 1)
            }
            .onEnded { _ in
                startLocation.wrappedValue = nil
                location.wrappedValue = nil
                isCircleVisible.wrappedValue = false
            }
    }
}
