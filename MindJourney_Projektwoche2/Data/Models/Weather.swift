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
    let temperatur: Double
    let descriprion: WeatherDescriprion
    let date: Date
    
    init(temperatur: Double, descriprion: WeatherDescriprion, date: Date) {
        self.temperatur = temperatur
        self.descriprion = descriprion
        self.date = date
    }
    
    init(temperatur: Double, descriprion: WeatherDescriprion, date: Date) {
        self.temperatur = temperatur
        self.descriprion = descriprion
        self.date = date
    }
}
enum WeatherDescriprion: String, CaseIterable {
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
