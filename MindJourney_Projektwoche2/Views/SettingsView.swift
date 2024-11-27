//
//  SettingsView.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 25.11.24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var loginVM: AuthViewModel
    @StateObject private var notificationViewModel: NotificationViewModel = NotificationViewModel()

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
            Toggle(isOn: notificationViewModel.$authorizationForSendingNotifications) {
                Text(notificationViewModel.authorizationForSendingNotifications ? "Freigabe erteilt" : "Freigabe erteilen")
            }.onChange(of: notificationViewModel.authorizationForSendingNotifications) {
                if notificationViewModel.authorizationForSendingNotifications {
                    notificationViewModel.requestAuthorization()
                } else {
                    notificationViewModel.removeAllNotifications()
                }
                
            }
            if (notificationViewModel.authorizationForSendingNotifications == true) {
                DatePicker(
                    "Zur welchen Uhrzeit sollen wir Sie erinnern?",
                    selection: notificationViewModel.$selection,
                    displayedComponents: .hourAndMinute
                ).onChange(of: notificationViewModel.selection) {
                    let (hour, minute) = notificationViewModel.extractHourAndMinute(from: notificationViewModel.selection)
                    notificationViewModel
                        .sendDailyNotificationOnTime(
                            title: "Tägliche Erinnerung!",
                            message: "Erzähle mir: Wie war dein Tag?",
                            hour: hour,
                            minute: minute
                        )
                }
            }
        }
    }
}


#Preview {
    SettingsView()
}
