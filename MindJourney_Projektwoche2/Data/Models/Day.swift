//
//  Day.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 25.11.24.
//

import SwiftUI

struct Day {
    var text: String
    var date: Date
    var mood: Mood
    var pictures: [UIImage]
    var audios: [String]
    var tags: [String]
    var weather: Weather
    var colors: [Color]
    var goal: Bool
}
