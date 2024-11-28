//
//  SettingsView.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 25.11.24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var loginVM: AuthViewModel
    @StateObject private var settingsViewModel: SettingsViewModel = SettingsViewModel()

    var body: some View {
        VStack{
            Button(action: {
                loginVM.logout()
            }) {
                Text("Logout")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            Text("Sollen wir Sie regelmäßig daran erinnern, ein Eintrag ins Tagebuch zu machen?")
                .frame(width: 200)
            Toggle(isOn: settingsViewModel.$authorizationForSendingNotifications) {
                Text(settingsViewModel.authorizationForSendingNotifications ? "Freigabe erteilt" : "Freigabe erteilen")
            }.onChange(of: settingsViewModel.authorizationForSendingNotifications) {
                if settingsViewModel.authorizationForSendingNotifications {
                    settingsViewModel.requestAuthorization()
                } else {
                    settingsViewModel.removeAllNotifications()
                }
                
            }
            if (settingsViewModel.authorizationForSendingNotifications == true) {
                DatePicker(
                    "Zur welchen Uhrzeit sollen wir Sie erinnern?",
                    selection: settingsViewModel.$selection,
                    displayedComponents: .hourAndMinute
                ).onChange(of: settingsViewModel.selection) {
                    let (hour, minute) = settingsViewModel.extractHourAndMinute(from: settingsViewModel.selection)
                    settingsViewModel
                        .sendDailyNotificationOnTime(
                            title: "Tägliche Erinnerung!",
                            message: "Erzähle mir: Wie war dein Tag?",
                            hour: hour,
                            minute: minute
                        )
                }
            }
        }.animatedBackground()
    }
}


#Preview {
    SettingsView()
}
