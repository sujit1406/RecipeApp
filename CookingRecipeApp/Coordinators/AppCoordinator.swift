//
//  AppCoordinator.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import SwiftUI
import Combine

class AppCoordinator: ObservableObject {
    @Published var currentFlow: AppFlow = .splash
    @Published var isAuthenticated: Bool = false
    
    private let appState: AppState
    private var cancellables = Set<AnyCancellable>()
    
    init(appState: AppState = AppState.shared) {
        self.appState = appState
        
        // Observe authentication state changes
        appState.$isAuthenticated
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isAuthenticated in
                self?.isAuthenticated = isAuthenticated
                self?.updateFlow()
            }
            .store(in: &cancellables)
    }
    
    private func updateFlow() {
        if isAuthenticated {
            currentFlow = .main
        } else {
            currentFlow = .auth
        }
    }
    
    func start() {
        // Check if user is already authenticated
        if appState.isAuthenticated {
            currentFlow = .main
        } else {
            currentFlow = .splash
        }
    }
    
    func navigateToAuth() {
        currentFlow = .auth
    }
    
    func navigateToMain() {
        currentFlow = .main
    }
}

enum AppFlow {
    case splash
    case auth
    case main
} 