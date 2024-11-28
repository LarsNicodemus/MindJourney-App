//
//  PlaceholderDayCellView.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 28.11.24.
//

import SwiftUI

struct PlaceholderDayCellView: View {
    let date: Date
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 40, height: 60)
                    .overlay {
                        VStack{
                            Spacer()
                            Text(shortDate(date))
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

