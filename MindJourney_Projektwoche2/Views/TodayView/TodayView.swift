//
//  TodayView.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 25.11.24.
//

import SwiftUI
import SwiftData


struct TodayView: View {
    @StateObject private var createVM: CreateViewModel = CreateViewModel()
    @Query var journalEntries: [Day]
    @State var selectedEntries: [Day] = []
    var test = [MOCKDAY, MOCKDAY, MOCKDAY]
    var body: some View {
        ScrollView{
            WeatherView()
                .padding(.horizontal)
            
            VStack{
                HStack{
                    Spacer()
                    Button{
                        selectedEntries = []
                        if let firstEntry = journalEntries.first {
                            if journalEntries.count == 1 {
                                selectedEntries.append(firstEntry)
                            } else {
                                let numberOfEntries = min(3, journalEntries.count)
                                let randomEntries = journalEntries.shuffled().prefix(numberOfEntries)
                                selectedEntries.append(contentsOf: randomEntries)
                            }
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                }
                .padding()

                HStack{
                    ForEach(selectedEntries, id: \.self){ entry in
                        NavigationLink(destination: JournalDayView(day: entry)){
                            TodayEntrieSubView(createVM: createVM, entry: entry)
                        }
                    }
                }
                .padding()
                    .navigationTitle("Journal Entries")
            }
            
            MoodCalendarView(days: journalEntries)
            
            

            Spacer()
        }.animatedBackground()
            .scrollIndicators(.hidden)
            .onAppear {
                if selectedEntries.isEmpty {
                    if let firstEntry = journalEntries.first {
                        if journalEntries.count == 1 {
                            selectedEntries.append(firstEntry)
                        } else {
                            let numberOfEntries = min(3, journalEntries.count)
                            let randomEntries = journalEntries.shuffled().prefix(numberOfEntries)
                            selectedEntries.append(contentsOf: randomEntries)
                        }
                    }
                }
            }
            .contentMargins(.bottom, 100)
    }
}

#Preview {
    
    TodayView()
}

