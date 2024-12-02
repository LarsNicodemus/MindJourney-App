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
    @Environment(\.dismiss) private var dismiss
    @Query var days: [Day]
    
    let radius: CGFloat = 150
    var diameter: CGFloat {
        radius * 2
    }

    @State private var startLocation: CGPoint?
    @State private var location: CGPoint?
    @State private var isCircleVisible: Bool = false
    //@State var bgColor: Color = .blue
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Text("Neuen Eintrag erstellen")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    MoodSelectionView(selectedMood: $createVM.mood)
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.blue.opacity(0.5),
                                                Color.purple.opacity(0.5)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 5, y: 5)
                                    .shadow(color: Color.purple.opacity(0.4), radius: 10, x: -5, y: -5)
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .opacity(0.8)
                                    .frame(width: 350, height: 142)
                            }
                                .padding()
                        )
                    VStack{
                        Text("Erinnerung eintragen")
                        TextInputSubView(createVM: createVM)
                    }
                    .padding()
                    
                    AddImagesView(selectedImages: $createVM.selectedImages)
                        .padding()
                    
                    
                    ColorPickView(startLocation: $startLocation, location: $location, isCircleVisible: $isCircleVisible, bgColor: $createVM.colors)
                        .padding()
                    
                    Button("Sprachmemo aufzeichnen"){
                        createVM.recorder.toggle()
                    }
                    .sheet(isPresented: $createVM.recorder) {
                        RecordView(createVM: createVM).presentationDetents([.medium])
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    .frame(width: 350, height: 80)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    
                    Button("Speichern") {
                        createVM.saveDay(context: context)
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    .frame(width: 350, height: 80)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    
                }
                .padding()
            }
            .animatedBackground()
            CircleView(isCircleVisible: $isCircleVisible, startLocation: $startLocation, location: $location, diameter: diameter, radius: radius, bgColor: $createVM.colors)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(isCircleVisible ? createVM.colors : Color.clear)
        .gesture(colorPickerDragGesture(
            startLocation: $startLocation,
            location: $location,
            isCircleVisible: $isCircleVisible,
            bgColor: $createVM.colors,
            radius: radius
        ))
        
    }
}

#Preview {
    CreateView()
        .modelContainer(for: Day.self, inMemory: true)
}

