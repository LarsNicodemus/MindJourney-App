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
    var weatherDescription: String
    var date: Date
    
    init(temperatur: Double, weatherDescription: String, date: Date) {
        self.temperatur = temperatur
        self.weatherDescription = weatherDescription
        self.date = date
    }
}
