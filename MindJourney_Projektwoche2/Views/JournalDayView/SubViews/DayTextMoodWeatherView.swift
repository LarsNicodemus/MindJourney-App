////
////  DayTextMoodWeatherView.swift
////  Test1
////
////  Created by Lars Nicodemus on 27.11.24.


import SwiftUI

struct DayTextMoodWeatherView: View {
    var journalEntry: Day
    @Binding var showFullText: Bool
    @Binding var weatherEmoji: WeatherEmoji
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(journalEntry.date, format: .dateTime.day().month().year())
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(hex: journalEntry.colors))
                    .stroke(.black, lineWidth: 0.5)
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 8)
                Text(journalEntry.mood.emoji)
                    .font(.system(size: 30))
                    .padding(.trailing, 8)
                Text(weatherEmoji.emoji)
                    .font(.system(size: 30))
                    .padding(.trailing, 8)
            }
            .padding(.bottom, 2)
            
            Text(journalEntry.text)
                .frame(maxHeight: showFullText ? .infinity : 200)
                .onTapGesture {
                    showFullText.toggle()
                }
            if !showFullText {
                HStack {
                    Spacer()
                    Text("weiterlesen...")
                        .foregroundColor(.secondary)
                }.onTapGesture {
                    showFullText.toggle()
                }
            }
        }
        .padding(8)
        .background(.blue.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.clear)
                .stroke(.black, lineWidth: 0.5)
        }
    }
}

