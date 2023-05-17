//
//  appFolsApp.swift
//  appFols
//
//  Created by Sarah Watremet on 28/04/2023.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct AppFolsApp: App {
  init() {
    setupAuthentication()
  }
  
  var body: some Scene {
    WindowGroup {
      RootView()
    }
  }
}

extension AppFolsApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}
