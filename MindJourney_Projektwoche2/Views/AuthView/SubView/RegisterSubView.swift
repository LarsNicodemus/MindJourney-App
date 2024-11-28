//
//  TextFieldSubView.swift
//  MindJourney_Projektwoche2
//
//  Created by Andreas Beer on 25.11.24.
//

import SwiftUI

struct RegisterSubView: View {
    @EnvironmentObject var loginVM: AuthViewModel
    @State private var isShowingNextScreen = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
            VStack(spacing: 20) {
                VStack {
                    Text("Welcome")
                        .foregroundColor(.black)
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        
                    Text("Register")
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
                    loginVM.register()
                }) {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                
                Button(action: {dismiss()}) {
                    Text("Already have an account? Login")
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
    RegisterSubView()
        .environmentObject(AuthViewModel())
}
