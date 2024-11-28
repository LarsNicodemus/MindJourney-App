//
//  Mockdata.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 25.11.24.
//

import SwiftUI


var MOCKDAY = Day(
    text: "Heute war ein Tag voller Gegensätze. Morgens begann alles so ruhig - ich wachte mit dem sanften Schein der Novembersonne auf, die durch die Vorhänge drang. Eine Tasse Kaffee und meine Gedanken schienen noch in einem warmen Nebel zu schweben.Gegen Mittag änderte sich die Stimmung komplett. Ein wichtiges Meeting bei der Arbeit forderte all meine Konzentration. Die Präsentation über unser neues Projektkonzept lief überraschend gut - meine Kollegin Sarah nickte anerkennend, als ich meine Ideen vorstellte. Diese Momente der Bestätigung sind es, die mir Kraft geben.Nach der Arbeit traf ich mich mit Alex im kleinen Café an der Ecke. Wir sprachen über seine bevorstehende Reise nach Südamerika und ich spürte diese unbändige Sehnsucht nach Veränderung und Abenteuer. Manchmal frage ich mich, ob ich mutiger sein sollte.Der Abend wurde ruhiger. Ein warmer Tee, ein gutes Buch und die leise Musik im Hintergrund ließen mich zur Ruhe kommen. Ich dachte über die kleinen Momente nach, die den Tag besonders gemacht haben - das Lächeln der Verkäuferin, der kurze Moment der Stille im Büro, der Duft von frischem Brot.Morgen steht ein Wochenende voller Möglichkeiten bevor. Ich bin gespannt, was es bringen wird.Gute Nacht.",
    date: Date(),
    mood: .calm,
    pictures: [],
    tags: ["guter Tag", "Wetter gut", "spaß am Coden", "gute Laune", "Frisur sitzt" , "Wetter gut", "spaß am Coden", "gute Laune", "Frisur sitzt", "Frisur sitzt" , "Wetter gut", "spaß am Coden", "gute Laune", "Frisur sitzt","guter Tag", "Wetter gut", "spaß am Coden", "gute Laune", "Frisur sitzt" , "Wetter gut", "spaß am Coden", "gute Laune", "Frisur sitzt", "Frisur sitzt" , "Wetter gut", "spaß am Coden", "gute Laune", "Frisur sitzt"],
    audios: [],
    weather: Weather(temperatur: 12.1, descriprion: .snowy, date: Date()),
    colors: [.red],
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
