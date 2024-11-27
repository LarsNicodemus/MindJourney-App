//
//  MoodSelectionView.swift
//  MindJourney_Projektwoche2
//
//  Created by Lars Nicodemus on 26.11.24.
//

import SwiftUI

struct MoodSelectionView: View {
    @State private var selectedMood: Mood = .happy

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),

    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 2) {
            ForEach(Mood.allCases, id: \.self) { mood in
                Text(mood.emoji)
                    .font(.system(size: 24))
                    .frame(minWidth: 60, minHeight: 60)
                    .background(
                        mood == selectedMood ? mood.backgroundColor : .clear
                    )
                    .cornerRadius(40)
                    .onTapGesture { selectedMood = mood }
            }
        }
        .padding()
        .background(Color.clear)
    }
}


#Preview {
    MoodSelectionView()
}
