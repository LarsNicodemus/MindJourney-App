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

func hexStringToColor(_ hex: String) -> UIColor? {
    var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
    
    var rgb: UInt64 = 0
    guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
        return nil
    }
    
    let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
    let blue = CGFloat(rgb & 0x0000FF) / 255.0
    
    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
} 

func colorToUiColor(_ color: Color) -> String  {
    let uiColor = UIColor(color)
    return colorToHexString(uiColor)
    
}
