//
//  RecordingsViewModel.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 26.11.24.
//

import SwiftUI
import AVFoundation
//import Combine


class RecorderViewModel2: NSObject, ObservableObject, AVAudioRecorderDelegate, AVAudioPlayerDelegate  {
    
    @Published var recordings: [Recording] = []
    @Published var audioLevels: [CGFloat] = Array(repeating: 20, count: 30)
    
    private var audioRecorder: AVAudioRecorder?
    private var audioPlayer: AVAudioPlayer?
    
    private var meterTimer: Timer?
    
    func startRecording() {
        let sequence = (recordings.last?.sequence ?? 0) + 1
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMyyyy_HHmmss"
        let dateString = formatter.string(from: Date())
        let fileName = "Recording_\(sequence)_\(dateString).m4a"
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)
        
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: path, settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.isMeteringEnabled = true
            audioRecorder?.record()
            
            startRecording()
        } catch {
            print(error)
        }
    }
    
    func stopRecording() {
        audioRecorder?.stop()
        audioRecorder = nil
        
        stopMeterTimer()
    }
    
    
    func fetchRecordings() {
    
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    do {

        let files = try FileManager.default.contentsOfDirectory(at: directory, includingPropertiesForKeys: [.creationDateKey], options: .skipsHiddenFiles)

        let fetchedRecordings = files.filter { $0.pathExtension == "ma" }.compactMap { url -> Recording? in
            let attributes = try? FileManager.default.attributesOfItem(atPath: url.path)
            let creationDate = attributes?[.creationDate] as? Date ?? Date()
            
            let fileName = url.lastPathComponent
            let components = fileName.split(separator: "_")
            let sequence = components.count > 1 ? Int (components [1]) ?? 0 : 0
            return Recording (url: url, date: creationDate, sequence: sequence)
        }
            // Sort recordings by sequence
            recordings = fetchedRecordings.sorted (by: { $0.sequence < $1.sequence })
        } catch {
            // Handle errors in fetching files.
            print(error)
        }
    }
    
    func playRecording(url: URL, completition: @escaping (Bool) -> Void) {
        stopPlayback()
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.play()
            //completion(true)
        } catch {
            print(error)
            //completion(false)
        }
    }
    
    func stopPlayback() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    
    func deleteRecording(url: URL) {
        do {
            try FileManager.default.removeItem(at: url)
            fetchRecordings()
        } catch {
            print(error)
        }
    }
    
    private func startMeterTimer() {
        meterTimer = Timer
            .scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { [weak self] _ in
                self?.updateAudioLevels()
            })
    }
    
    private func stopMeterTimer() {
        meterTimer?.invalidate()
        meterTimer = nil
    }
    
    private func updateAudioLevels() {
        guard let recorder = audioRecorder else { return }
        recorder.updateMeters()
        let averagePower = recorder.averagePower(forChannel: 0)
        let normalizedLevel = self.normalizedPowerLevel(fromDecibels: averagePower)
        // Update the audioLevels array
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
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            fetchRecordings ()
        } else {
            print ("Recording was not successful.")
        }
    }
    
}
