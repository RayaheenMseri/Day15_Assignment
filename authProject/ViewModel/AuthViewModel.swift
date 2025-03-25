//
//  AuthViewModel.swift
//  authProject
//
//  Created by Rayaheen Mseri on 25/09/1446 AH.
//

import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false  // Tracks user authentication state.
    @Published var errorMessage: String?  // Stores error messages for UI feedback.
    
    init() {
        checkIfUserLoggedIn()
    }
    
    func checkIfUserLoggedIn() {
        if Auth.auth().currentUser != nil {
            isLoggedIn = true  // User is already authenticated.
        } else {
            isLoggedIn = false
        }
    }
    
    func signUp(email: String, password: String) {
        self.errorMessage = nil  // Reset error message before attempting signup.
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription  // Display error if signup fails.
                    return
                } else {
                    self.isLoggedIn = true  // Update state when signup succeeds.
                }
            }
        }
    }
    
    func signIn(email: String, password: String) {
        self.errorMessage = nil  // Reset error message before attempting login.
        Auth.auth().signIn(with: EmailAuthProvider.credential(withEmail: email, password: password)) { result, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription  // Display error if login fails.
                    return
                } else {
                    self.isLoggedIn = true  // Update state when login succeeds.
                }
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                print("Logged out")
                self.isLoggedIn = false  // Reset authentication state after logout.
            }
        } catch {
            print("Error signing out: \(error)")
        }
    }
}
