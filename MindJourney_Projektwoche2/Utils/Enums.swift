//
//  Enums.swift
//  Test1
//
//  Created by Lars Nicodemus on 25.11.24.
//

import SwiftUI

enum WeatherAPIError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case decodingError(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Die URL ist ungültig"
        case .networkError(let error):
            return "Netzwerkfehler: \(error.localizedDescription)"
        case .invalidResponse:
            return "Ungültige Serverantwort"
        case .decodingError(let error):
            return "Fehler beim Dekodieren der Daten: \(error.localizedDescription)"
        }
    }
}


enum WeatherEmoji: String, CaseIterable {
    
    case sunny = "Glücklich"
    case snow = "Zufrieden"
    case rainy = "Motiviert"
   
    var emoji: String {
        switch self {
        case .sunny: "☀️"
        case .snow: "🌨️"
        case .rainy: "🌧️"
        }
    }
}


enum WeatherDescription: String, CaseIterable {
    case sunny = "Sonnig"
    case rainy = "Regen"
    case snowy = "Schnee"
    
    var id: String {
        return self.rawValue.capitalized
    }
    
    var gif: String {
        switch self {
        case .sunny:
            return "sunny"
        case .rainy:
            return "rainy"
        case .snowy:
            return "snowy"
        }
    }
}
