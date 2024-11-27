//
//  SettingsView.swift
//  MindJourney_Projektwoche2
//
//  Created by Muhammet Incirkus on 25.11.24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var loginVM: AuthViewModel
    var body: some View {
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
    }
}

#Preview {
    SettingsView()
}
