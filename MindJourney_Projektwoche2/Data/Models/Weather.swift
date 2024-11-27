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
    var beschreibung: String
    var datum: Date
    
    init(temperatur: Double, beschreibung: String, datum: Date) {
        self.temperatur = temperatur
        self.beschreibung = beschreibung
        self.datum = datum
    }
}
