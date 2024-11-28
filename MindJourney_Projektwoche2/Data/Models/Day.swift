//
//  Day.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 25.11.24.
//

import SwiftUI
import SwiftData

@Model
class Day:Identifiable {
    
    var id: UUID = UUID()
    var text: String
    var date: Date
    var mood: Mood
    var pictures: [String]
    var audios: [String]
    var tags: [String]
    var weather: Weather?
    var colors: String
    var goal: Bool
    
    init(
        id: UUID = UUID(),
        text: String,
        date: Date,
        mood: Mood,
        pictures: [String],
        audios: [String],
        tags: [String],
        weather: Weather?,
        colors: String,
        goal: Bool
    ) {
        self.id = id
        self.text = text
        self.date = date
        self.mood = mood
        self.pictures = pictures
        self.audios = audios
        self.tags = tags
        self.weather = weather
        self.colors = colors
        self.goal = goal
    }
}



