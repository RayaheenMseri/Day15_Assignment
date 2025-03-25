//
//  HomeView.swift
//  authProject
//
//  Created by Rayaheen Mseri on 25/09/1446 AH.
//

import SwiftUI

struct HomeView: View {
    @State var isLoggedIn: Bool = false  // This state variable is not used; consider removing it.
    @StateObject var viewModel = AuthViewModel()  // Observes authentication state.

    var body: some View {
        VStack {
            Image("welcome")
                .resizable()
                .frame(width: 400, height: 200)
                .scaledToFit()
                .padding(.bottom, 50)

            Spacer()

            Text("Log Out")
                .foregroundColor(.white)
                .background {
                    Capsule()
                        .fill(.black)
                        .frame(width: 200, height: 50)
                }
                .padding()
                .onTapGesture {
                    viewModel.logOut()  // Calls log out function when tapped.
                }
        }
        .fullScreenCover(isPresented: .constant(!viewModel.isLoggedIn)) { // Ensures LogInView appears when user is not logged in.
            LogInView()
        }
    }
}

#Preview {
    HomeView()
}
