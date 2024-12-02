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
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack{
            Text("Einstellungen")
                .font(.system(size: 30, weight: .bold, design: .rounded))
            Form {
                Section(header: Text("General")
                    .bold()
                    .foregroundStyle(.black)
                    .underline()
                    .font(.callout)
                ) {
                    
                    NavigationLink() {
                        ApperanceView()
                    } label: {
                        Label("Appearance", systemImage: "lightswitch.on")
                    }
                    
                    NavigationLink() {
                        AccessNotifiView()
                    } label: {
                        Label("Accessibility & Notifications", systemImage: "switch.2")
                    }
                    
                    
                    
                }
                
                Section(header: Text("Support")
                    .bold()
                    .foregroundStyle(.black)
                    .underline()
                    .font(.callout)
                ) {
                    
                    NavigationLink() {
                        ReportView()
                    } label: {
                        Label("Report an issue", systemImage: "exclamationmark.circle")
                    }
                    
                    NavigationLink() {
                        HStack {
                            ScrollView{
                                FAQView()
                                    .padding()
                            }
                        }
                    } label: {
                        Label("FAQ", systemImage: "questionmark.circle")
                    }
                    
                }
                
            }
            .scrollContentBackground(.hidden)
            .background(.clear)
            
            
            
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
            Spacer()
            
        }.animatedBackground()
    }
}


#Preview {
    SettingsView()
}


/*
 
 @EnvironmentObject var loginVM: AuthViewModel
 @EnvironmentObject var settingsViewModel: SettingsViewModel
 //@AppStorage("selectedTheme") var selectedTheme: Theme = .system
 @Environment(\.colorScheme) var colorScheme
 
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
         //Toggle("NightMode", isOn: $settingsViewModel.darkmode)
         Picker("", selection: $settingsViewModel.selectedTheme) {
             ForEach(Theme.allCases) { them in
                 Text(them.rawValue).tag(them)
             }
         }.pickerStyle(.segmented)
             .onChange(of: settingsViewModel.selectedTheme) { _ in
                         settingsViewModel.updateTheme(colorScheme: colorScheme)
                     }
                     .onAppear {
                         settingsViewModel.updateTheme(colorScheme: colorScheme)
                     }
     }
 }
 
 */
