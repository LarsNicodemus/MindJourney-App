//
//  TabModel.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 25.11.24.
//

import SwiftUI

enum TabModel: String, CaseIterable {
    case today = "bookmark"
    case create = "plus.circle"
    case journals = "book.pages"
    case settings = "gearshape"
    
    
    var title: String {
        switch self {
        case .today:  "Heute"
        case .create: "Create"
        case .journals:  "Einträge"
        case .settings:  "Einstellungen"
        }
    }
    
    var navigateTo: AnyView {
        switch self {
        case .today: return AnyView(TodayView())
        case .create: return AnyView(CreateView())
        case .journals: return AnyView(JournalsView())
        case .settings: return AnyView(SettingsView())
        }
    }
}
