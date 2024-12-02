import SwiftUI

struct AccessNotifiView: View {
    @State private var notificationsEnabled = false
    @State private var selectedLanguage = "Deutsch"
    @State private var selectedFontSize = "Medium"
    @StateObject private var settingsViewModel: SettingsViewModel = SettingsViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Sprache der App")) {
                        Picker("Sprache", selection: $selectedLanguage) {
                            Text("Deutsch").tag("Deutsch")
                            Text("Englisch").tag("Englisch")
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    Section(header: Text("Schriftgröße")) {
                        Picker("Schriftgröße", selection: $selectedFontSize) {
                            Text("Klein").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Groß").tag("Large")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                .navigationTitle("Accessibility & Notifications")
                .navigationBarTitleDisplayMode(.inline)
                .frame(width:.infinity, height: 200)
                
                VStack {
                    Text("Sollen wir Sie regelmäßig daran erinnern, ein Eintrag ins Tagebuch zu machen?")
                        .font(.headline)
                        .padding(.top)
                    
                    Toggle(isOn: settingsViewModel.$authorizationForSendingNotifications) {
                        Text(settingsViewModel.authorizationForSendingNotifications ? "Freigabe erteilt" : "Freigabe erteilen")
                            .font(.subheadline)
                    }
                    .padding(.vertical)
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
                    
                    if settingsViewModel.authorizationForSendingNotifications {
                        VStack {
                            Text("Zur welchen Uhrzeit sollen wir Sie erinnern?")
                                .font(.subheadline)
                                .padding(.bottom, 5)
                            
                            DatePicker(
                                "",
                                selection: settingsViewModel.$selection,
                                displayedComponents: .hourAndMinute
                            )
                            .labelsHidden()
                            .onChange(of: settingsViewModel.selection) { newSelection in
                                let (hour, minute) = settingsViewModel.extractHourAndMinute(from: newSelection)
                                settingsViewModel.sendDailyNotificationOnTime(
                                    title: "Tägliche Erinnerung!",
                                    message: "Erzähle mir: Wie war dein Tag?",
                                    hour: hour,
                                    minute: minute
                                )
                            }
                            .datePickerStyle(WheelDatePickerStyle())
                        }
                        .padding(.vertical)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 5))
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("Save")
                        .bold()
                        .frame(width: 200)
                        .padding()
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding(.bottom)
            }
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}

#Preview {
    AccessNotifiView()
}

