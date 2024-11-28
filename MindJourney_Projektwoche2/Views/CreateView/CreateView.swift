//
//  CreateView.swift
//  MindJourney_Projektwoche2
//
//  Created by Andreas Beer on 27.11.24.
//

import SwiftUI
import SwiftData

struct CreateView: View {
    @StateObject private var createVM: CreateViewModel = CreateViewModel()
    @Environment(\.modelContext) private var context
    @Query var days: [Day]
    var body: some View {
        ScrollView {
            VStack {
                
                MoodSelectionView(selectedMood: $createVM.mood)
                
                
                TextInputSubView(createVM: createVM)
                
                
                AddImagesView(selectedImages: $createVM.selectedImages)
                
                
                ColorPickView(bgColor: $createVM.colors)
                
                
                Button("Speichern") {
                    
                    createVM.saveDay(context: context)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }.animatedBackground()
    }
}

#Preview {
    CreateView()
        .modelContainer(for: Day.self, inMemory: true)
}

