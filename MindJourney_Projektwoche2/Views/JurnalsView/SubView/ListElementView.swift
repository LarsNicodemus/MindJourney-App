//
//  ListElementView.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 29.11.24.
//

import SwiftUI

struct DayListElementView: View {
    @StateObject private var createVM: CreateViewModel = CreateViewModel()
    
    let day: Day
    var body: some View {
        HStack{
            Text(day.mood.emoji)
            VStack(alignment: .leading){
                HStack {
                    Text(day.date, format: .dateTime.day().month().year())
                    if day.weather != nil {
                        Text("\(day.weather!.temperatur.description) °C")
                    }
                }
                Text(day.text).lineLimit(1).frame(width: 200)
            }
//            if (!day.pictures.isEmpty || day.pictures.first != "") {
//                if let uiimage = createVM.loadImage(from: day.pictures.first!) {
//                    Image(uiImage: uiimage)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 30, height: 30)
//                }
//                
//            } else {
//                Image(systemName: "photo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 30, height: 30)
//            }
            
        }
        .padding()
//        .frame(maxWidth: .infinity)
        .background(hexStringToColor2(day.colors))
        .clipShape(.rect(cornerRadius: 5))
    }
}

#Preview {
    DayListElementView(day: Day(
        text: "Das ist ein Beispieltext, Das ist ein Beispieltext, Das ist ein Beispieltext, Das ist ein Beispieltext, Das ist ein Beispieltext, Das ist ein Beispieltext, Das ist ein Beispieltext, Das ist ein Beispieltext, ",
        date: Date(),
        mood: .euphoric,
        pictures: ["", "", ""],
        audios: ["", "", ""],
        tags: ["tag1", "tag2", "tag3"],
        weather: Weather(
            temperatur: 15.7,
            weatherDescription: .rainy,
            date: Date()
        ),
        colors: "#D9DCAC",
        goal: false
    ))
}


/*
 var temperatur: Double
 var weatherDescription: WeatherDescription
 var date: Date
 
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
 
 */
