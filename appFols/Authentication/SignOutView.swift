//
//  SignOutView.swift
//  appFols
//
//  Created by Sarah Watremet on 12/05/2023.
//

import SwiftUI

struct SignOutView: View {
  @StateObject private var viewModel = AuthenticationViewModel()
  @Binding var showSignInView: Bool
  
  var body: some View {
    Button("Sign Out") {
      Task {
        do {
          try viewModel.signOut()
          showSignInView = true
        } catch {
          print(error)
        }
      }
    }
  }
}

struct LogOutView_Previews: PreviewProvider {
  static var previews: some View {
    SignOutView(showSignInView: .constant(false))
  }
}
