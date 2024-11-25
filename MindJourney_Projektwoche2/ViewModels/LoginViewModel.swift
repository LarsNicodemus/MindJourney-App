//
//  LoginViewModel.swift
//  MindJourney_Projektwoche2
//
//  Created by Andreas Beer on 25.11.24.
//

import FirebaseAuth
import Foundation


class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
        
    }
    
}
