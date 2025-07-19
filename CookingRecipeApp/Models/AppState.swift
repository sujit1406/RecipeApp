//
//  AppState.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import Foundation
import SwiftUI

class AppState: ObservableObject {
    @Published var currentUser: User?
    @Published var isAuthenticated: Bool = false
    @Published var isLoading: Bool = false
    
    static let shared = AppState()
    
    private init() {}
    
    func signIn(user: User) {
        self.currentUser = user
        self.isAuthenticated = true
    }
    
    func signOut() {
        self.currentUser = nil
        self.isAuthenticated = false
    }
} 