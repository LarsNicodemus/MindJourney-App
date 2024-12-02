//
//  MindJourney_Projektwoche2App.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 25.11.24.
//

import SwiftUI
import Firebase



@main
struct MindJourney_Projektwoche2App: App {
    @StateObject private var loginVM: AuthViewModel = AuthViewModel()
    @StateObject private var settingsViewModel = SettingsViewModel()

    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {

            LoginView()
                .environmentObject(loginVM)
                .environmentObject(settingsViewModel)
                .modelContainer(for: [Day.self])
                .environment(\.colorScheme, settingsViewModel.darkmode ? .dark : .light)
          
        }
    }
}
