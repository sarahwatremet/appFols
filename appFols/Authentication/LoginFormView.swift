//
//  LoginFormView.swift
//  appFols
//
//  Created by Sarah Watremet on 28/04/2023.
//

import SwiftUI

struct LoginFormView: View {
  @StateObject var viewModel = AuthenticationViewModel()
  
  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
      TextField("Email address", text: $viewModel.userEmail)
        .textContentType(.emailAddress)
        .padding()
        .background(Colors.blueTide.opacity(0.7))
        .cornerRadius(10)
      
      SecureField("Password", text: $viewModel.userPassword)
        .padding()
        .background(Colors.blueTide.opacity(0.7))
        .cornerRadius(10)
    }
    .padding([.leading, .trailing], 15)
  }
}

struct LoginFormView_Previews: PreviewProvider {
  static var previews: some View {
    LoginFormView()
  }
}
