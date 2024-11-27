//
//  Mockdata.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 25.11.24.
//

import SwiftUI


var MOCKDAY = Day(
    text: "Heute war ein guter Tag",
    date: Date(),
    mood: .calm,
    pictures: [],
    audios: [],
    tags: ["guter Tag", "Wetter gut", "spaß am Coden", "gute Laune", "Frisur sitzt"],
    weather: Weather(temperatur: 12.1, beschreibung: "wolkig", datum: Date()),
    colors: [.blue],
    goal: false
)



var MOCKGOAL = Goal(
    title: "Bewerbung versenden",
    descriptionText: "bis zum 10.12.24 möchte ich min. 10 Bewerbungen versenden.",
    createDate: "20.11.2024",
    deadline: "10.12.2024")

var MOCKGOALS = [
    Goal(
        id: UUID(),
        title: "Bewerbung versenden",
        descriptionText: "bis zum 10.12.24 möchte ich min. 10 Bewerbungen versenden.",
        createDate: "20.11.2024",
        deadline: "10.12.2024"),
    Goal(
        id: UUID(),
        title: "Bewerbung versenden",
        descriptionText: "bis zum 10.12.24 möchte ich min. 10 Bewerbungen versenden.",
        createDate: "20.11.2024",
        deadline: "10.12.2024"),
    Goal(
        id: UUID(),
        title: "Bewerbung versenden",
        descriptionText: "bis zum 10.12.24 möchte ich min. 10 Bewerbungen versenden.",
        createDate: "20.11.2024",
        deadline: "10.12.2024"),
    Goal(
        id: UUID(),
        title: "Bewerbung versenden",
        descriptionText: "bis zum 10.12.24 möchte ich min. 10 Bewerbungen versenden.",
        createDate: "20.11.2024",
        deadline: "10.12.2024"),
    Goal(
        id: UUID(),
        title: "Bewerbung versenden",
        descriptionText: "bis zum 10.12.24 möchte ich min. 10 Bewerbungen versenden.",
        createDate: "20.11.2024",
        deadline: "10.12.2024"),
]
