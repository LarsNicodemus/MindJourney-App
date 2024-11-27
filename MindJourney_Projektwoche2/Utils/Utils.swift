//
//  Utils.swift
//  MindJourney_Projektwoche2
//
//  Created by Andreas Beer on 27.11.24.
//
import SwiftUI

func colorToHexString(_ color: UIColor) -> String {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    
    color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    
    return String(format: "#%02X%02X%02X",
        Int(red * 255),
        Int(green * 255),
        Int(blue * 255))
}
