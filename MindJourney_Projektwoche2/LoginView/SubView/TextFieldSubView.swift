//
//  TextFieldSubView.swift
//  MindJourney_Projektwoche2
//
//  Created by Andreas Beer on 25.11.24.
//

import SwiftUI

struct TextFieldSubView: View {
    @EnvironmentObject var loginVM: LoginViewModel
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome")
                .foregroundColor(.black)
                .font(.system(size: 60, weight: .bold, design: .rounded))
                .offset(x: -60,y:-200)
            
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
            
            Button {
                
            } label: {
                Text("Already have an account? Login")
                    .bold()
                    .foregroundColor(.white)
            }
            .padding(.top)
        }
        .padding()
    }
}

#Preview {
    TextFieldSubView()
}
