//
//  JournalEntryViewModel.swift
//  Test1
//
//  Created by Lars Nicodemus on 27.11.24.
//
import SwiftUI

class JournalEntryViewModel: ObservableObject {
    @Published var journalEntries: [Day]
    @Published var journalEntry: Day
    @Published var tagsVisible: Bool = false
    @Published var audiosVisible: Bool = false
    @Published var goalsVisible: Bool = false
    @Published var showFullText: Bool = false
    @Published var weatherEmoji: WeatherEmoji = .rainy
    @Published var currentIndex = 0
    @Published var selectedImageIndex = 0
    @Published var preview = false
    @Published var swipeOffset: CGFloat = 0
    @Published var goalChecked = false
    
    init(journalEntries: [Day] = [MOCKDAY,MOCKDAY,MOCKDAY,MOCKDAY], journalEntry: Day = MOCKDAY) {
        self.journalEntries = journalEntries
        self.journalEntry = journalEntry
        
    }
    
    func getJournalEntry(){
        journalEntry = MOCKDAY
    }
    
    func getJournalEntries(){
        journalEntries = [MOCKDAY,MOCKDAY,MOCKDAY,MOCKDAY]
    }
}
