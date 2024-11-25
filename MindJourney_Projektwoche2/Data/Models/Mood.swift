//
//  Mood.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 25.11.24.
//

import SwiftUI

enum Mood: String, CaseIterable {
    
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
}
