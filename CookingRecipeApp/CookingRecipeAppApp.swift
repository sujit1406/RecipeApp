//
//  CookingRecipeAppApp.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 18/06/24.
//

import SwiftUI

@main
struct CookingRecipeAppApp: App {
    @StateObject private var appCoordinator = AppCoordinator()
    @StateObject private var appState = AppState.shared
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appCoordinator.currentFlow {
                case .splash:
                    SplashView(coordinator: appCoordinator)
                case .auth:
                    AuthView()
                case .main:
                    MainTabView(appState: appState)
                }
            }
            .environmentObject(appState)
            .environmentObject(appCoordinator)
        }
    }
}
