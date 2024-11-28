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
	audios: [],
    tags: ["guter Tag", "Wetter gut", "spaß am Coden", "gute Laune", "Frisur sitzt" , "Wetter gut", "spaß am Coden", "gute Laune", "Frisur sitzt", "Frisur sitzt" , "Wetter gut", "spaß am Coden", "gute Laune", "Frisur sitzt","guter Tag", "Wetter gut", "spaß am Coden", "gute Laune", "Frisur sitzt" , "Wetter gut", "spaß am Coden", "gute Laune", "Frisur sitzt", "Frisur sitzt" , "Wetter gut", "spaß am Coden", "gute Laune", "Frisur sitzt"],
    weather: Weather(temperatur: 12.1, weatherDescription: "Sonnig", date: Date()),
    colors: colorToHexString(.black),
    goal: false
)


var MOCKDAYS = [
    Day(
            text: "Ein hektischer Tag im Büro.",
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            mood: .stressed,
            pictures: [],
            audios: [],
            tags: ["Arbeit", "Stress", "Meeting"],
            weather: Weather(temperatur: 10.5, weatherDescription: "Sonnig" , date: Date()),
            colors: colorToHexString(.red),
            goal: false
        ),
        Day(
            text: "Ein ruhiger Abend mit einem guten Buch.",
            date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
            mood: .calm,
            pictures: [],
            audios: [],
            tags: ["Lesen", "Entspannung", "Tee"],
            weather: Weather(temperatur: 8.0, weatherDescription: "Regen" , date: Date()),
            colors: colorToHexString(.blue),
            goal: true
        ),
        Day(
            text: "Ein sportlicher Tag im Fitnessstudio.",
            date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
            mood: .motivated,
            pictures: [],
            audios: [],
            tags: ["Sport", "Training", "Fitness"],
            weather: Weather(temperatur: 12.0, weatherDescription: "Regen", date: Date()),
            colors: colorToHexString(.green),
            goal: true
        ),
    Day(
            text: "Ein sportlicher Tag im Fitnessstudio, ich habe hart trainiert!",
            date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
            mood: .motivated,
            pictures: [],
            audios: [],
            tags: ["Sport", "Training", "Fitness"],
            weather: Weather(temperatur: 12.0, weatherDescription: "Regen" , date: Date()),
            colors: colorToHexString(.green),
            goal: true
        ),
        Day(
            text: "Ein kreativer Tag, ich habe viele neue Ideen entwickelt.",
            date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!,
            mood: .thoughtful,
            pictures: [],
            audios: [],
            tags: ["Kreativität", "Ideen", "Nachdenken"],
            weather: Weather(temperatur: 14.0, weatherDescription: "Regen" , date: Date()),
            colors: colorToHexString(.gray),
            goal: true
        ),
        Day(
            text: "Ein frustrierender Tag, alles ging schief.",
            date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!,
            mood: .angry,
            pictures: [],
            audios: [],
            tags: ["Frust", "Stress", "Missverständnis"],
            weather: Weather(temperatur: 16.0, weatherDescription: "Regen" , date: Date()),
            colors: colorToHexString(.red),
            goal: false
        ),
        Day(
            text: "Ein sehr produktiver Tag, ich konnte viel abarbeiten.",
            date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!,
            mood: .motivated,
            pictures: [],
            audios: [],
            tags: ["Produktivität", "Arbeit", "Zufriedenheit"],
            weather: Weather(temperatur: 20.0, weatherDescription: "Schnee" , date: Date()),
            colors: colorToHexString(.orange),
            goal: true
        ),
        Day(
            text: "Ein trauriger Tag, ich habe mich über eine Nachricht geärgert.",
            date: Calendar.current.date(byAdding: .day, value: -7, to: Date())!,
            mood: .sad,
            pictures: [],
            audios: [],
            tags: ["Traurig", "Enttäuscht", "Gedanken"],
            weather: Weather(temperatur: 5.0, weatherDescription: "Schnee", date: Date()),
            colors: colorToHexString(.blue),
            goal: false
        ),
        Day(
            text: "Heute war ein richtig euphorischer Tag, alles ging einfach gut!",
            date: Calendar.current.date(byAdding: .day, value: -8, to: Date())!,
            mood: .euphoric,
            pictures: [],
            audios: [],
            tags: ["Glück", "Euphorie", "Erfolg"],
            weather: Weather(temperatur: 22.0, weatherDescription: "Schnee" , date: Date()),
            colors: colorToHexString(.darkGray),
            goal: true
        )
]


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
