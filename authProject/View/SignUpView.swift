//
//  SignUpView.swift
//  authProject
//
//  Created by Rayaheen Mseri on 25/09/1446 AH.
//

import SwiftUI
struct SignUpView: View {
    @State var hasAccount: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    @StateObject var viewModel = AuthViewModel()  // Manages authentication logic.

    var body: some View {
        VStack {
            Image("key")
                .resizable()
                .frame(width: 200, height: 200)
                .scaledToFit()

            Text("Sign Up")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 50)

            VStack(alignment: .leading, spacing: 20) {
                Text("Email")
                    .bold()
                TextField("", text: $email)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)

                Text("Password")
                SecureField("", text: $password)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
            }

            if let error = viewModel.errorMessage {  // Displays error message if signup fails.
                Text(error)
                    .foregroundColor(.red)
            }

            Button("Sign Up") {
                viewModel.signUp(email: email, password: password)  // Calls signup function.
            }
            .frame(width: 100, height: 50)
            .foregroundColor(.white)
            .bold()
            .padding(.horizontal)
            .background {
                Capsule()
                    .fill(Color.black)
            }
            .padding()

            HStack {
                Text("Already have an account?")
                    .font(.caption)

                Text("Log In")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        hasAccount.toggle()  // Toggles to login view.
                    }
            }
            .padding()
        }
        .fullScreenCover(isPresented: $hasAccount) {
            LogInView()
        }
        .fullScreenCover(isPresented: $viewModel.isLoggedIn) { // Redirects to HomeView if signup is successful.
            HomeView()
        }
        .padding()
    }
}

#Preview {
    SignUpView()
}
