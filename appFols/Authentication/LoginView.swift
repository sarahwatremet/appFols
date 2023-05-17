//
//  LoginView.swift
//  appFols
//
//  Created by Sarah Watremet on 28/04/2023.
//

import Firebase
import SwiftUI

struct LoginView: View {
  @StateObject var viewModel = AuthenticationViewModel()
  
  var body: some View {
    ZStack {
      Colors.beige200.ignoresSafeArea()
        .opacity(0.2)
      VStack {
        Spacer()
        
        Image("nookbestfriends")
          .resizable()
          .frame(width: 200, height: 200)
          .clipShape(Circle())
          .padding(.bottom, 50)
        
        Text("Hello!")
          .font(.largeTitle).foregroundColor(Colors.blueDark)
          .padding([.top, .bottom], 40)
        
//        LoginFormView()
        
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
        
        Spacer()
        
        Button(action: {
          viewModel.signUp()
        }) {
          Text("Sign Up")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Colors.blueDark)
            .cornerRadius(10)
        }
        .padding(15)
        
        HStack(spacing: 0) {
          Text("Already have an account? ")
          Button(action: {
            // sign in
          }) {
            Text("Sign In")
              .foregroundColor(Colors.greenLight)
          }
        }
        .padding(.bottom, 15)
        
        Image("tide3")
          .resizable()
          .aspectRatio(contentMode: .fit)
      }
      .edgesIgnoringSafeArea(.bottom)
    }
  }
}
  
  
struct UserLoginView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      LoginView()
    }
  }
}
  
