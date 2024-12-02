////
////  JournalDayView.swift
////  Journal
////
////  Created by Lars Nicodemus on 26.11.24.
////
//

import SwiftUI

struct JournalDayView: View {
    @StateObject var journalVM: JournalEntryViewModel = JournalEntryViewModel()
    let day: Day
    var day: Day
    var body: some View {

        VStack {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        if !day.pictures.isEmpty {
                            PicturePreviewView(
                                images: day.pictures,
                                onTapImage: { index in
                                    journalVM.selectedImageIndex = index
                                    journalVM.preview = true
                                }
                            )
                            .frame(maxWidth: .infinity, maxHeight: 400)
                        }
                        DayTextMoodWeatherView(
                            journalEntry: day, showFullText: $journalVM.showFullText,
                            weatherEmoji: $journalVM.weatherEmoji)
                        
                        if !day.audios.isEmpty {
                            AudioPlayView(
                                jEN: day,
                                audio: day.audios[0])
                        }
                        if !day.goal {
                            GoalSubView(goalisChecked: $journalVM.goalChecked)
                        }
                        if !day.tags.isEmpty {
                            HStack {
                                HStack {
                                    Text("Tags:")
                                    Button(action: {
                                        journalVM.tagsVisible.toggle()
                                    }) {
                                        Image(
                                            systemName: journalVM.tagsVisible
                                            ? "chevron.up" : "chevron.down")
                                    }
                                }
                                Spacer()
                            }
                        }
                        TagsSubView(
                            journalEntry: day, tagsVisible: $journalVM.tagsVisible)
                    }
                    .padding()
                }
                .background(Color(hex: day.colors).opacity(0.1).ignoresSafeArea())
                if journalVM.preview {
                    PictureFullScreenView(
                        journalEntry: day, currentIndex: $journalVM.currentIndex,
                        selectedImageIndex: $journalVM.selectedImageIndex, preview: $journalVM.preview,
                        swipeOffset: $journalVM.swipeOffset)
                }
            }
        }.animatedBackground()
    }
}

#Preview {
    JournalDayView(day: Day(
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

