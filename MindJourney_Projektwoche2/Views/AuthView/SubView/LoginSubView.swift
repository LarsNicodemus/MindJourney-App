//
//  LoginSubView.swift
//  MindJourney_Projektwoche2
//
//  Created by Andreas Beer on 26.11.24.
//

import SwiftUI

struct LoginSubView: View {
    @EnvironmentObject var loginVM: AuthViewModel
    @State private var isShowingNextScreen = false
    
    var body: some View {
        
            VStack(spacing: 20) {
                VStack {
                    Text("Welcome")
                        .foregroundColor(.black)
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        
                    Text("Login")
                        .foregroundColor(.black)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                }
                .offset(x: -60, y: -190)
                
                TextField("E-Mail", text: $loginVM.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                
                SecureField("Passwort", text: $loginVM.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    loginVM.login()
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                
                NavigationLink(destination: RegisterView()) {
                    Text("Dont have an account? Register")
                        .bold()
                        .foregroundColor(.red)
                }
                .padding(.top)
            }
            .padding()
            .toolbar(.hidden)
        }
    }


#Preview {
    LoginSubView()
        .environmentObject(AuthViewModel())
}
