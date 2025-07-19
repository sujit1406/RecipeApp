//
//  MainCoordinator.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import SwiftUI

class MainCoordinator: ObservableObject {
    @Published var selectedTab: Tab = .home
    @Published var showingAddRecipe = false
    @Published var selectedRecipe: Recipe?
    
    enum Tab {
        case home
        case saved
        case add
        case notifications
        case profile
    }
    
    func selectTab(_ tab: Tab) {
        selectedTab = tab
    }
    
    func showAddRecipe() {
        showingAddRecipe = true
    }
    
    func hideAddRecipe() {
        showingAddRecipe = false
    }
    
    func showRecipeDetail(_ recipe: Recipe) {
        selectedRecipe = recipe
    }
    
    func hideRecipeDetail() {
        selectedRecipe = nil
    }
} 