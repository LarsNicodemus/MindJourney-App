//
//  AudioPlayView.swift
//  Journal
//
//  Created by Lars Nicodemus on 26.11.24.
//

import SwiftUI

struct AudioPlayView: View {
    var jEN: Day
    var audio:String = ""
    var audioTitle: String = "audiotitle123"
    var audioDate: String = "26.11.2024"
    var audioLength: String = "0:30"
    @State var audioIsPlaying: Bool = true
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(audioTitle)
                    .font(.system(size: 20, weight: .bold))
                Text(audioDate)
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
            Text(audioLength)
                .padding(.trailing)

            Button{
                audioIsPlaying.toggle()
            } label: {
                Image(systemName: audioIsPlaying ? "pause.fill" : "play.fill")
            }
            .buttonStyle(.borderedProminent)
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
    AudioPlayView(jEN: MOCKDAY)
}
