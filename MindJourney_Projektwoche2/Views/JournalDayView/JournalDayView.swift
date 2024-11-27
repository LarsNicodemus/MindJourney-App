//
//  JournalDayView.swift
//  Journal
//
//  Created by Lars Nicodemus on 26.11.24.
//

import SwiftUI

struct JournalDayView: View {
    var journalEntry: Day = MOCKDAY
    @State var tagsVisible: Bool = false
    @State var audiosVisible: Bool = false
    @State var goalsVisible: Bool = false
    @State var showFullText: Bool = false
    @State var weatherEmoji: WeatherEmoji = .rainy
    @State var currentIndex = 0
    @State var selectedImageIndex = 0
    @State var preview = false
    @State var swipeOffset: CGFloat = 0
    @State var goalChecked = false
    var body: some View {

        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                        PicturePreviewView(
                            images: journalEntry.pictures,
                            onTapImage: { index in
                                selectedImageIndex = index
                                preview = true
                            }
                        )
                        .frame(maxWidth: .infinity, maxHeight: 400)
                    
                    DayTextMoodWeatherView(
                        journalEntry: journalEntry, showFullText: $showFullText,
                        weatherEmoji: $weatherEmoji)

                    if !journalEntry.audios.isEmpty {
                        AudioPlayView(
                            jEN: journalEntry,
                            audio: journalEntry.audios.first ?? "")
                    }
                    if !journalEntry.goal {
                        GoalSubView(goalisChecked: $goalChecked)
                    }
                    if !journalEntry.tags.isEmpty {
                        HStack {
                            HStack {
                                Text("Tags:")
                                Button(action: {
                                    tagsVisible.toggle()
                                }) {
                                    Image(
                                        systemName: tagsVisible
                                            ? "chevron.up" : "chevron.down")
                                }
                            }
                            Spacer()
                        }
                    }
                    TagsSubView(
                        journalEntry: journalEntry, tagsVisible: $tagsVisible)
                }
                .padding()
            }
            .background(
                journalEntry.colors.first.opacity(0.1).ignoresSafeArea())
            if preview {
                PictureFullScreenView(
                    journalEntry: journalEntry, currentIndex: $currentIndex,
                    selectedImageIndex: $selectedImageIndex, preview: $preview,
                    swipeOffset: $swipeOffset)
            }
        }
    }
}

#Preview {
    JournalDayView()
}
