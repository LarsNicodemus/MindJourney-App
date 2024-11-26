//
//  LoginView.swift
//  MindJourney_Projektwoche2
//
//  Created by Andreas Beer on 25.11.24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var loginVM: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                LoginSubView()
            }
            .background {
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 1000, height: 800)
                        .rotationEffect(.degrees(135))
                        .offset(x: -150, y: -450)
                }
            }
            .navigationDestination(isPresented: $loginVM.userIsLoggedIn) {
                AppNavigationView()
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
