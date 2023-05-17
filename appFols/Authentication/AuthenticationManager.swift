//
//  AuthenticationManager.swift
//  appFols
//
//  Created by Sarah Watremet on 12/05/2023.
//

import Firebase
import Foundation

struct AuthDataResultModel {
  let uid: String
  let email: String?
  
  init(user: User) {
    self.uid = user.uid
    self.email = user.email
  }
}

final class AuthenticationManager {
  static let shared = AuthenticationManager()
  private init() { }
  
  // for sign up
  func createUser(email: String, password: String) async throws -> AuthDataResultModel {
    let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
    return AuthDataResultModel(user: authDataResult.user)
  }
  
  // user already exists: sign in
  func getAuthenticatedUser() throws -> AuthDataResultModel {
    guard let user = Auth.auth().currentUser else {
      throw URLError(.badServerResponse)
    }
    return AuthDataResultModel(user: user)
  }
  
  func signOut() throws {
    try Auth.auth().signOut()
  }
}
