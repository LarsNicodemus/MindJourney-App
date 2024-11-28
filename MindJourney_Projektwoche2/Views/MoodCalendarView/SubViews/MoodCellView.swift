//
//  MoodCellView.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 28.11.24.
//

import SwiftUI

struct MoodCellView: View {
    let day: Day
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(day.mood.backgroundColor)
                    .frame(width: 40, height: 60)
                    .overlay {
                        VStack{
                            Spacer()
                            Text(day.mood.emoji)
                                .font(.title2)
                            Spacer()
                            Text(shortDate(day.date))
                                .font(.caption)
                                .foregroundColor(.gray)
                                .padding(.bottom, 4)
                        }
                    }
                
                    
            }
            
        }
    }
    
    private func shortDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
}
