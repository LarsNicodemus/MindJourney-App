//
//  LoginViewModel.swift
//  MindJourney_Projektwoche2
//
//  Created by Andreas Beer on 25.11.24.
//


import FirebaseAuth
import Foundation


class AuthViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var userIsLoggedIn = false
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Registration error: \(error.localizedDescription)")
            } else {
                print("User registered successfully.")
                self.userIsLoggedIn = true
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
            } else {
                print("User logged in successfully.")
                self.userIsLoggedIn = true
            }
        }
    }
    
//    func userIsLogtIn() {
//        Auth.auth().addStateDidChangeListener { _, user in
//            DispatchQueue.main.async {
//                self.userIsLoggedIn = (user != nil)
//            }
//        }
//    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            self.userIsLoggedIn = false
            print("User successfully logged out.")
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
    
}
