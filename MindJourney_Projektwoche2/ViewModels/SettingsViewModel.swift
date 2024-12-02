//
//  SettingsViewModel.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 27.11.24.
//

import UserNotifications
import SwiftUI

class SettingsViewModel: ObservableObject {
    
    //@Environment(\.colorScheme) var colorScheme
    
    @AppStorage("selection") var selection: Date = Date()
    @AppStorage("authorizationForSendingNotifications") var authorizationForSendingNotifications: Bool = false
    @Published var darkmode: Bool = false
    @AppStorage("selectedTheme") var selectedTheme: Theme = .light
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(
                options: [.alert, .badge, .sound]
        ) { success, error in }
    }
    
    func sendDailyNotificationOnTime(title: String, message: String, hour: Int, minute: Int) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = message
        
        var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    
    func extractHourAndMinute(from date: Date) -> (Int, Int) {
            let components = Calendar.current.dateComponents([.hour, .minute], from: date)
            let hour = components.hour ?? 0
            let minute = components.minute ?? 0
            return (hour, minute)
        }
    
    func removeAllNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }

//    func selectTheme() {
//        switch(selectedTheme) {
//        case .light:
//            darkmode = false
//        case .dark:
//            darkmode = true
//        case .system:
//            darkmode = colorScheme == .dark ? true : false
//        }
//    }
    
    func updateTheme(colorScheme: ColorScheme) {
            switch selectedTheme {
            case .light:
                darkmode = false
            case .dark:
                darkmode = true
//            case .system:
//                darkmode = colorScheme == .dark
            }
        }
    
}
