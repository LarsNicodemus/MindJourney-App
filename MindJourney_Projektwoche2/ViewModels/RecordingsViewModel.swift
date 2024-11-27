//
//  RecordingsViewModel.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 26.11.24.
//

import SwiftUI
import AVFoundation


class RecorderViewModel: NSObject, ObservableObject, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    @Published var audioLevels: [CGFloat] = Array(repeating: 20, count: 30)
    @Published var recordedFiles: [URL] = []
    
    private var audioRecorder: AVAudioRecorder?
    private var audioPlayer: AVAudioPlayer?
    
    @Published var path: URL?
    
    @Published var isRecording = false
    @Published var isPlaying = false

    @Published var recordingDuration: TimeInterval = 0
    @Published var playbackDuration: TimeInterval = 0
        
    private var recordingTimer: Timer?
    private var playbackTimer: Timer?
    
    override init() {
        super.init()
        loadRecordedFiles()
    }
    

    private func getDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    
    private func updateAudioLevels() {
        guard let recorder = audioRecorder else { return }
        recorder.updateMeters()
        let averagePower = recorder.averagePower(forChannel: 0)
        let normalizedLevel = self.normalizedPowerLevel(fromDecibels: averagePower)
        
        DispatchQueue.main.async {
            self.audioLevels.append (normalizedLevel)
            if self.audioLevels.count > 30 {
                self.audioLevels.removeFirst()
            }
        }
    }
    
    private func normalizedPowerLevel(fromDecibels decibels: Float) -> CGFloat {
        if decibels < -80 {
            return 0.0
        } else if decibels >= 0 {
            return 1.0
        } else {
            let level = (decibels + 80) / 80
            return CGFloat (level)
        }
    }

    
    func startRecording() {
        stopAudio()
        
            let formatter = DateFormatter()
            formatter.dateFormat = "ddMMyyyy_HHmmss"
            let dateString = formatter.string(from: Date())
            let fileName = "Recording_\(dateString).m4a"
            path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)

            let settings = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 44100,
                AVNumberOfChannelsKey: 2,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]

            do {
                if let audioFilename = path {
                    audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
                    audioRecorder?.record()
                    isRecording = true
                    recordingDuration = 0
                    
                    // Starte Timer für die Aufnahme
                    recordingTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        self.recordingDuration += 1
                    }
                }
            } catch {
                print("Fehler beim Starten der Aufnahme: \(error.localizedDescription)")
            }
        }

        func stopRecording() {
            audioRecorder?.stop()
            audioRecorder = nil
            isRecording = false
            recordingTimer?.invalidate()
            recordingTimer = nil
        
            if let path = path {
                    // Überprüfen, ob die Datei existiert
                    if FileManager.default.fileExists(atPath: path.path) {
                        print("Aufnahme abgeschlossen und Datei vorhanden: \(path)")
                        recordedFiles.append(path)
                    } else {
                        print("Aufnahme abgeschlossen, aber Datei nicht gefunden: \(path)")
                    }
                }
        }
    
    func playAudio() {
        stopAudio()
        
            guard let audioFilename = path else { return }
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioFilename)
                audioPlayer?.delegate = self
                playbackDuration = audioPlayer?.duration ?? 0 // Setze die Dauer der Wiedergabe
                isPlaying = true
                
                // Starte Timer für die Wiedergabe
                playbackTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    if self.playbackDuration > 0 {
                        self.playbackDuration -= 1
                    } else {
                        self.stopAudio() // Stoppe, wenn Dauer abgelaufen
                    }
                }
                
                audioPlayer?.play()
            } catch {
                print("Fehler beim Abspielen der Datei: \(error.localizedDescription)")
            }
        }

        func stopAudio() {
            audioPlayer?.stop()
            isPlaying = false
            playbackTimer?.invalidate()
            playbackTimer = nil
        }

        func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
            DispatchQueue.main.async {
                self.isPlaying = false
                self.playbackTimer?.invalidate()
                self.playbackTimer = nil
            }
        }
    
    private func saveRecordedFiles() {
            let filePaths = recordedFiles.map { $0.path }
            UserDefaults.standard.set(filePaths, forKey: "recordedFiles")
        }

        private func loadRecordedFiles() {
            if let filePaths = UserDefaults.standard.array(forKey: "recordedFiles") as? [String] {
                recordedFiles = filePaths.map { URL(fileURLWithPath: $0) }
            }
        }
}
