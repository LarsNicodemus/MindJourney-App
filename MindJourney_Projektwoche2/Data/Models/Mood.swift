//
//  Mood.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 25.11.24.
//

import SwiftUI

enum Mood: String, CaseIterable,Codable {
    
    case happy = "Glücklich"
    case satisfied = "Zufrieden"
    case motivated = "Motiviert"
    case calm = "Gelassen"
    case thoughtful = "Nachdenklich"
    case sad = "Traurig"
    case angry = "Wütend"
    case stressed = "Gestresst"
    case worried = "Besorgt"
    case euphoric = "Euphorisch"
    
    var emoji: String {
        switch self {
        case .happy : "😊"
        case .satisfied : "🙂"
        case .motivated : "💪"
        case .calm : "😌"
        case .thoughtful : "🤔"
        case .sad : "😢"
        case .angry : "😠"
        case .stressed : "😣"
        case .worried : "😟"
        case .euphoric : "🤩"
        }
    }
    var backgroundColor: Color {
        switch self {
        case .happy: .yellow.opacity(0.3)
        case .satisfied: .green.opacity(0.3)
        case .motivated: .orange.opacity(0.3)
        case .calm: .blue.opacity(0.2)
        case .thoughtful: .gray.opacity(0.2)
        case .sad: .blue.opacity(0.3)
        case .angry: .red.opacity(0.3)
        case .stressed: .purple.opacity(0.3)
        case .worried: .pink.opacity(0.3)
        case .euphoric: .indigo.opacity(0.3)
        }
    }
}
