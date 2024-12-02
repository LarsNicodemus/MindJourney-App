//
//  AudioPlayView.swift
//  Journal
//
//  Created by Lars Nicodemus on 26.11.24.
//

import SwiftUI

struct AudioPlayView: View {
    
    @StateObject private var recorder = RecorderViewModel()
    var jEN: Day
    var audio: String
    var audioTitle: String = "audiotitle123"
    var audioDate: String = "26.11.2024"
    var audioLength: String = "0:30"
    @State var audioIsPlaying: Bool = false
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Aufzeichnung")
                    .font(.system(size: 20, weight: .bold))
                Text(jEN.date, format: .dateTime.day().month().year())
                    .font(.caption)
            }
            .padding(.trailing)
            Spacer()
            Image(systemName: "waveform")
                .resizable()
                .frame(width: 30, height: 20)
                .foregroundStyle(
                    LinearGradient(
                        colors: audioIsPlaying ? [
                            .black, .black, .gray, .blue.opacity(0.5), .blue, .blue
                        ] : [.black],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.trailing)
                .symbolEffect(.variableColor, isActive: audioIsPlaying)
            Spacer()
            Text("\(Int(recorder.playbackDuration))s")
                .padding(.trailing)

            Button{
//                audioIsPlaying.toggle()
                
                //recorder.path = recorder.loadAudio(from: audio)
                recorder.playAudio()
            } label: {
                Image(systemName: audioIsPlaying ? "pause.fill" : "play.fill")
            }
            .buttonStyle(.borderedProminent)
            .onAppear{
                recorder.path = recorder.loadAudio(from: audio)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color.blue.opacity(0.1))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.clear)
                .stroke(.black, lineWidth: 0.5)
        }
        .cornerRadius(10)
        
    }
}

#Preview {
    AudioPlayView(jEN: MOCKDAY, audio: "")
}
