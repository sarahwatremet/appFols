//
//  RootView.swift
//  appFols
//
//  Created by Sarah Watremet on 12/05/2023.
//

import SwiftUI

struct RootView: View {
  @State private var showSignInView: Bool = false
  
  var body: some View {
    ZStack {
      NavigationStack {
        SignOutView(showSignInView: $showSignInView)
      }
    }
    .onAppear {
      let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
      self.showSignInView = authUser == nil
    }
    .fullScreenCover(isPresented: $showSignInView) {
      NavigationStack {
        LoginView()
      }
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}
