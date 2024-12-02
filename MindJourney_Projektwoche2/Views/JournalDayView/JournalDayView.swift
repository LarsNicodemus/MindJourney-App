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
    var body: some View {

        VStack {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        if !journalVM.journalEntry.pictures.isEmpty {
                            PicturePreviewView(
                                images: journalVM.journalEntry.pictures,
                                onTapImage: { index in
                                    journalVM.selectedImageIndex = index
                                    journalVM.preview = true
                                }
                            )
                            .frame(maxWidth: .infinity, maxHeight: 400)
                        }
                        DayTextMoodWeatherView(
                            journalEntry: journalVM.journalEntry, showFullText: $journalVM.showFullText,
                            weatherEmoji: $journalVM.weatherEmoji)
                        
                        if !journalVM.journalEntry.audios.isEmpty {
                            AudioPlayView(
                                jEN: journalVM.journalEntry,
                                audio: journalVM.journalEntry.audios.first ?? "")
                        }
                        if !journalVM.journalEntry.goal {
                            GoalSubView(goalisChecked: $journalVM.goalChecked)
                        }
                        if !journalVM.journalEntry.tags.isEmpty {
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
                            journalEntry: journalVM.journalEntry, tagsVisible: $journalVM.tagsVisible)
                    }
                    .padding()
                }
                .background(Color(hex: journalVM.journalEntry.colors).opacity(0.1).ignoresSafeArea())
                if journalVM.preview {
                    PictureFullScreenView(
                        journalEntry: journalVM.journalEntry, currentIndex: $journalVM.currentIndex,
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

