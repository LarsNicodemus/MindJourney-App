//
//  Day.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 25.11.24.
//

import SwiftUI
import SwiftData

@Model
class Day: Identifiable {
    var id: UUID = UUID()
    var text: String
    var date: Date
    var mood: Mood
    var picturesData: Data
    var audiosData: Data
    var tagsData: Data
    var weather: Weather?
    var colors: String
    var goal: Bool

    var pictures: [String] {
        get {
            (try? JSONDecoder().decode([String].self, from: picturesData)) ?? []
        }
        set {
            picturesData = (try? JSONEncoder().encode(newValue)) ?? Data()
        }
    }

    var audios: [String] {
        get {
            (try? JSONDecoder().decode([String].self, from: audiosData)) ?? []
        }
        set {
            audiosData = (try? JSONEncoder().encode(newValue)) ?? Data()
        }
    }

    var tags: [String] {
        get {
            (try? JSONDecoder().decode([String].self, from: tagsData)) ?? []
        }
        set {
            tagsData = (try? JSONEncoder().encode(newValue)) ?? Data()
        }
    }

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
        self.picturesData = (try? JSONEncoder().encode(pictures)) ?? Data()
        self.audiosData = (try? JSONEncoder().encode(audios)) ?? Data()
        self.tagsData = (try? JSONEncoder().encode(tags)) ?? Data()
        self.weather = weather
        self.colors = colors
        self.goal = goal
    }
}

