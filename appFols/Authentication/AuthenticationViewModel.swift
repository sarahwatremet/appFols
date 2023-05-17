//
//  AuthenticationViewModel.swift
//  appFols
//
//  Created by Sarah Watremet on 12/05/2023.
//

import Firebase
import Foundation

@MainActor
final class AuthenticationViewModel: ObservableObject {
  @Published var userEmail: String = ""
  @Published var userPassword: String = ""
  @Published var userIsLoggedIn: Bool = false
  
  func signUp() {
    guard !userEmail.isEmpty, !userPassword.isEmpty else {
      print("Error while signin up")
      return
    }
    
    Task {
      do {
        let returnedUserData = try await AuthenticationManager.shared.createUser(email: userEmail, password: userPassword)
        print("Success")
        print(returnedUserData)
      } catch {
        print("Error: \(error)")
      }
    }
  }
  
  func signOut() throws {
    try AuthenticationManager.shared.signOut()
  }
}
