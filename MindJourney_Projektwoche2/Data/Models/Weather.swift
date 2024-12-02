//
//  Weather.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 25.11.24.
//
import SwiftUI
import SwiftData


@Model
class Weather {
    var temperatur: Double
    var weatherDescription: WeatherDescription
    var date: Date
    
    init(temperatur: Double, weatherDescription: WeatherDescription, date: Date) {
        self.temperatur = temperatur
        self.weatherDescription = weatherDescription
        self.date = date
    }
}


enum WeatherDescription: String, CaseIterable,Codable {
    case sunny = "Sonnig"
    case rainy = "Regen"
    case snowy = "Schnee"
    
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
