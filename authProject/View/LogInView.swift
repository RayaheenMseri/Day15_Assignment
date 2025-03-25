//
//  ContentView.swift
//  authProject
//
//  Created by Rayaheen Mseri on 25/09/1446 AH.
//

import SwiftUI

struct LogInView: View {
    @State var hasAccount: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    @StateObject var viewModel = AuthViewModel() // Manages authentication logic.
    
    var body: some View {
        VStack {
            Image("key")
                .resizable()
                .frame(width: 200,height: 200)
                .scaledToFit( )
            
            Text("Log In")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 50)
            
            VStack(alignment: .leading, spacing: 20){
                Text( "Email" )
                    .bold()
                TextField("", text: $email)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Text( "Password" )
                SecureField("", text: $password)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                
                
            }
            
            if let error  = viewModel.errorMessage {// Displays error message if signup fails.
                Text(error)
                    .foregroundColor(.red)
            }
            
            Button("Log In"){
                viewModel.signIn(email: email, password: password)// Calls signIn function.
                
            }
            .frame(width: 100, height: 50)
            .foregroundColor(.white)
            .bold()
            .padding(.horizontal)
            .background{
                Capsule()
                    .fill(Color.black)
                
            }
            .padding()
            
            HStack{
                Text("Don't have an account?")
                    .font(.caption)
                
                Text("Sign Up")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        hasAccount.toggle() // Toggles to signup view.
                    }
            }
            .padding()
            
            
        }
        .fullScreenCover(isPresented: $hasAccount){
            SignUpView()
        }
        .fullScreenCover(isPresented: $viewModel.isLoggedIn){
            // Redirects to HomeView if signup is successful.
            HomeView()
        }
        .padding()
    }
}

#Preview {
    LogInView()
}
