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
    @Published var colors: Color = .blue
    @Published var goal: Bool = false
    
    
    func saveDay(context: ModelContext) {
        let picturePaths = saveImages(selectedImages)
        print("Gespeicherte Bildpfade: \(picturePaths)")
        let colorHexStrings = colorToUiColor(colors) 
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
        print("Day: Id: " + day.id.debugDescription)
        print("Day: Text: " + day.text)
        print("Day: Datum: " + day.date.description)
        print("Day: Emoji: " + day.mood.emoji)
        print("Day: PicturePath: \(day.pictures)")
        print("Day: Tags: " + day.tags.description)
        print("Day: Wetter: " + (day.weather?.weatherDescription.rawValue ?? ""))
        print("Day: Farbe: " + day.colors)
        print("Day: Ziele: " + day.goal.description)
        
        print("Day: \(day)" )
        
        
        print("Day: Farbe: \(day.colors.debugDescription)")

        if let firstPicture = day.pictures.first { print("Erstes Bild: \(firstPicture)") } else { print("Keine Bilder vorhanden") }
        context.insert(day)
        
        do {
            try context.save()
            print("Tag gespeichert")
        } catch {
            print("Fehler beim Speichern: \(error.localizedDescription)")
        }
    }
    
    private func saveImages(_ images: [UIImage]) -> [String] {
        var savedPaths: [String] = []
        
        print("Images: \(images.debugDescription)")
        for image in images {
            
            if let data = image.jpegData(compressionQuality: 0.8) {
                let fileName = UUID().uuidString + ".jpg"
                print("ImageFilename: " + fileName)
                let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
                print("ImageFileURL: \(fileURL)")
                do {
                    try data.write(to: fileURL)
                    savedPaths.append(fileURL.absoluteString)
                    print(savedPaths)
                } catch {
                    print("Fehler beim Speichern des Bildes: \(error.localizedDescription)")
                }
            }
        }
        
        return savedPaths
    }
    
    func loadImage(from path: String) -> UIImage? {
            guard let url = URL(string: path),
                  let imageData = try? Data(contentsOf: url) else {
                return nil
            }
            return UIImage(data: imageData)
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
