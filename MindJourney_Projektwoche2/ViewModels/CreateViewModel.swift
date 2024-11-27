//
//  CreateViewModel.swift
//  MindJourney_Projektwoche2
//
//  Created by Andreas Beer on 27.11.24.
//
import SwiftUI
import SwiftData

class CreateViewModel: ObservableObject {
    @Published var input: String = ""
    @Published var textFieldHeight: CGFloat = 50
    @Published var selectedImages: [UIImage] = []
    @Published var mood: Mood = .happy
    @Published var tags: [String] = []
    @Published var weather: Weather?
    @Published var colors: [UIColor] = []
    @Published var goal: Bool = false
    
    
    func saveDay(context: ModelContext) {
        let picturePaths = saveImages(selectedImages)
        print(picturePaths.debugDescription)
        let colorHexStrings = colors.map { colorToHexString($0) }
        print(colorHexStrings.debugDescription)
        let day = Day(
            text: input,
            date: Date(),
            mood: mood,
            pictures: picturePaths,
            audios: [],
            tags: tags,
            weather: weather,
            colors: colorHexStrings,
            goal: goal
        )
        print(day.id.debugDescription)
        print(day.text)
        context.insert(day)
        
        do {
            try context.save()
        } catch {
            print("Fehler beim Speichern: \(error.localizedDescription)")
        }
    }
    
    private func saveImages(_ images: [UIImage]) -> [String] {
        var savedPaths: [String] = []
        
        for image in images {
            if let data = image.jpegData(compressionQuality: 0.8) {
                let fileName = UUID().uuidString + ".jpg"
                let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
                
                do {
                    try data.write(to: fileURL)
                    savedPaths.append(fileName)
                } catch {
                    print("Fehler beim Speichern des Bildes: \(error.localizedDescription)")
                }
            }
        }
        
        return savedPaths
    }
    
    private func getDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    
    func adjustHeight() {
        let lineHeight: CGFloat = 24
        let padding: CGFloat = 20
        let lines = input.split(separator: "\n").count
        textFieldHeight = CGFloat(lines) * lineHeight + padding
    }
}
