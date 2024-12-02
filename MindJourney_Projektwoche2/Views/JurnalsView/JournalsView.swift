//
//  JournalsView.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 25.11.24.
//

import SwiftUI
import SwiftData

struct JournalsView: View {
    @Query var journalEntries: [Day]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack{
                    ForEach(journalEntries) { entry in
                        NavigationLink(destination: JournalDayView(day: entry)) {
                        DayListElementView(day: entry)
                                            }
                                       
                    }
                    .overlay {
                        if journalEntries.isEmpty {

                            
                            ContentUnavailableView {
                                Image(systemName: "book.pages")
                                    .font(.system(size: 120))
                                    .foregroundStyle(.gray)
                                    .padding(.bottom, 32)
                                
                            } description: {
                                Text("Es sind noch keine Tagebucheinträge vorhanden")
                            } actions: {
                                Button("Starte mit deinem ersten Eintrag") {
                                    //
                                }
                            }
                        }
                    }
                    .navigationTitle("Journal Entries")
                    .scrollContentBackground(.hidden)
                    
                    
                }.background(.clear)
                
                
            }
            .padding(.horizontal)
            .contentMargins(.bottom, 100)
            .scrollIndicators(.hidden)
            .animatedBackground()
        }
    }
}

#Preview {
    JournalsView().modelContainer(for: [Day.self], inMemory: true)
}
