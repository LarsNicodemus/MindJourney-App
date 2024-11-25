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
    @StateObject private var loginVM: LoginViewModel = LoginViewModel()

    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(loginVM)
        }
    }
}
