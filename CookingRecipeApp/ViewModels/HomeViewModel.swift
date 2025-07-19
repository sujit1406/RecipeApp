//
//  HomeViewModel.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var featuredRecipes: [Recipe] = []
    @Published var allRecipes: [Recipe] = []
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let recipeService: RecipeServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(recipeService: RecipeServiceProtocol = RecipeService.shared) {
        self.recipeService = recipeService
        setupSearchSubscription()
        loadData()
    }
    
    private func setupSearchSubscription() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] searchQuery in
                if searchQuery.isEmpty {
                    self?.loadAllRecipes()
                } else {
                    self?.searchRecipes(query: searchQuery)
                }
            }
            .store(in: &cancellables)
    }
    
    func loadData() {
        loadFeaturedRecipes()
        loadAllRecipes()
    }
    
    private func loadFeaturedRecipes() {
        isLoading = true
        recipeService.fetchFeaturedRecipes()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] recipes in
                    self?.featuredRecipes = recipes
                }
            )
            .store(in: &cancellables)
    }
    
    private func loadAllRecipes() {
        isLoading = true
        recipeService.fetchAllRecipes()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] recipes in
                    self?.allRecipes = recipes
                }
            )
            .store(in: &cancellables)
    }
    
    private func searchRecipes(query: String) {
        isLoading = true
        recipeService.searchRecipes(query: query)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] recipes in
                    self?.allRecipes = recipes
                }
            )
            .store(in: &cancellables)
    }
    
    func toggleSavedRecipe(recipe: Recipe) {
        recipeService.toggleSavedRecipe(recipeId: recipe.id)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] _ in
                    // Update the recipe in both arrays
                    self?.updateRecipeSavedState(recipeId: recipe.id)
                }
            )
            .store(in: &cancellables)
    }
    
    private func updateRecipeSavedState(recipeId: UUID) {
        // Update in featured recipes
        if let index = featuredRecipes.firstIndex(where: { $0.id == recipeId }) {
            featuredRecipes[index].saved.toggle()
        }
        
        // Update in all recipes
        if let index = allRecipes.firstIndex(where: { $0.id == recipeId }) {
            allRecipes[index].saved.toggle()
        }
    }
} 