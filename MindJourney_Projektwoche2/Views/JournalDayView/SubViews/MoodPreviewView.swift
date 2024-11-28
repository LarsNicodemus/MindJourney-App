//
//  MoodPreviewView.swift
//  Journal
//
//  Created by Lars Nicodemus on 26.11.24.
//

import SwiftUI

struct MoodPreviewView: View {
    var jEN: Day
    var body: some View {
        HStack{
            VStack{
                Spacer()
                HStack{
                    Text("Stimmung:")
                        .font(.system(size: 20,weight: .semibold))
                    Text(jEN.mood.rawValue)
                        .font(.system(size: 20,weight: .semibold))
                    Spacer()
                }
            }
            VStack{
                HStack{
                    Text(jEN.mood.emoji)
                        .font(.system(size: 50))
                    
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(hex: jEN.colors))
        .cornerRadius(10)
    }
}

#Preview {
    MoodPreviewView(jEN: MOCKDAY)
}
