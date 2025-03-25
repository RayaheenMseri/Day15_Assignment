//
//  authProjectApp.swift
//  authProject
//
//  Created by Rayaheen Mseri on 25/09/1446 AH.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct authProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            if viewModel.isLoggedIn {
                HomeView()
            }else{
                LogInView()
            }
        }
    }
}
