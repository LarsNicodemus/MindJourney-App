//
//  ListElementView.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 29.11.24.
//

import SwiftUI

struct DayListElementView: View {
    @StateObject private var createVM: CreateViewModel = CreateViewModel()
    var printData = true
    
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
                Text(day.text).lineLimit(1)
            }
            Spacer()
            if day.pictures != [] {
                if let uiimage = createVM.loadImage(
                    from: day.pictures[0]
                ) {
                    Image(uiImage: uiimage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(.rect(cornerRadius: 3))
                }
            }
        }
        .padding()
        .background(.gray.mix(with: hexStringToColor2(day.colors)!, by: 0.3))
        .clipShape(.rect(cornerRadius: 5))

//        Button{
//            print("\(day.pictures)")
//            print("\(day.picturesData)")
//        } label: {
//            Text("Data")
//        }
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
