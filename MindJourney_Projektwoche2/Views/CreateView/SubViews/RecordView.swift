//
//  RecordView.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 26.11.24.
//

import AVFoundation
import SwiftUI

struct RecordView: View {

    @StateObject private var recorder = RecorderViewModel()
    @ObservedObject var createVM: CreateViewModel

    var body: some View {
        VStack {
            Button("Speichern"){
                if recorder.path != nil {
                    createVM.recorderPath = recorder.path!.absoluteString
                }
                createVM.recorder = false
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .frame(width: 350, height: 80)
            .font(.system(size: 16, weight: .regular, design: .rounded))
            .disabled(recorder.path == nil)
            HStack {
                VStack {
                    Button{
                        if recorder.isRecording {
                            recorder.stopRecording()
                        } else {
                            recorder.startRecording()
                        }
                    } label: {
                        Image(
                            systemName: recorder.isRecording
                            ? "stop.circle" : "mic.circle"
                        )
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)
                    }
                    Text(
                        recorder.isRecording
                        ? "Aufnahme läuft (\(Int(recorder.recordingDuration))s)"
                        : "Bereit zur Aufnahme"
                    )
                    .foregroundColor(.red)
                    .padding()
                }.onAppear{
                    //                recorder.startRecording()
                    //                recorder.stopRecording()
                }
                VStack {
                    
                    Button{
                        if recorder.isPlaying {
                            recorder.stopAudio()
                        } else {
                            recorder.playAudio()
                        }
                    } label: {
                        Image(
                            systemName: recorder.isPlaying
                            ? "stop.circle" : "play.circle"
                        )
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    }
                    Text(
                        recorder.isPlaying
                        ? "Wiedergabe läuft (\(Int(recorder.playbackDuration))s)"
                        : "Bereit zur Wiedergabe"
                    )
                    .foregroundColor(.blue)
                    .padding()
                }
            }
            .padding()
        }
    }
}

#Preview {
    RecordView(createVM: CreateViewModel())
}
