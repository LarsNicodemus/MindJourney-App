//
//  RecorderView.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 26.11.24.
//

import SwiftUI
import AVFoundation

struct RecorderView: View {
    
    @StateObject private var recorder = AudioRecorder()
    @StateObject private var player = AudioPlayer()
    
    var body: some View {
        VStack {
                   Text(recorder.isRecording ? "Aufnahme läuft..." : "Bereit zur Aufnahme")
                       .foregroundColor(.red)
                       .padding()

                   Button(action: {
                       if recorder.isRecording {
                           recorder.stopRecording()
                       } else {
                           recorder.startRecording()
                       }
                   }) {
                       Image(systemName: recorder.isRecording ? "stop.circle" : "mic.circle")
                           .resizable()
                           .frame(width: 100, height: 100)
                           .foregroundColor(.red)
                   }
               }
        VStack {
                    Text(player.isPlaying ? "Wiedergabe läuft..." : "Bereit zur Wiedergabe")
                        .foregroundColor(.blue)
                        .padding()

                    Button(action: {
                        if player.isPlaying {
                            player.stopAudio()
                        } else {
                            player.playAudio()
                        }
                    }) {
                        Image(systemName: player.isPlaying ? "stop.circle" : "play.circle")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.blue)
                    }
                }
    }
}

#Preview {
    RecorderView()
}


class AudioRecorder: ObservableObject {
    var audioRecorder: AVAudioRecorder?
    @Published var isRecording = false

    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.record()
            isRecording = true
        } catch {
            print("Fehler beim Starten der Aufnahme: \(error.localizedDescription)")
        }
    }

    func stopRecording() {
        audioRecorder?.stop()
        isRecording = false
    }

    private func getDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}


class AudioPlayer: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false

    func playAudio() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFilename)
            audioPlayer?.play()
            isPlaying = true
        } catch {
            print("Fehler beim Abspielen der Datei: \(error.localizedDescription)")
        }
    }

    func stopAudio() {
        audioPlayer?.stop()
        isPlaying = false
    }

    private func getDocumentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
