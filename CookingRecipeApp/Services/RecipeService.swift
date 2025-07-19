//
//  RecipeService.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import Foundation
import Combine

protocol RecipeServiceProtocol {
    func fetchFeaturedRecipes() -> AnyPublisher<[Recipe], Error>
    func fetchAllRecipes() -> AnyPublisher<[Recipe], Error>
    func searchRecipes(query: String) -> AnyPublisher<[Recipe], Error>
    func toggleSavedRecipe(recipeId: UUID) -> AnyPublisher<Bool, Error>
}

class RecipeService: RecipeServiceProtocol {
    static let shared = RecipeService()
    
    private init() {}
    
    // Sample data - in a real app, this would come from an API
    private let sampleRecipes: [Recipe] = [
        Recipe(name: "Classic Greek Salad", imageURL: "recipe1", time: 15, rating: 4.5, saved: true, category: "Salad"),
        Recipe(name: "Pasta Carbonara", imageURL: "recipe1", time: 25, rating: 4.8, saved: false, category: "Pasta"),
        Recipe(name: "Chicken Curry", imageURL: "recipe1", time: 45, rating: 4.6, saved: true, category: "Main Course"),
        Recipe(name: "Beef Stir Fry", imageURL: "recipe1", time: 20, rating: 4.3, saved: false, category: "Asian"),
        Recipe(name: "Vegetable Soup", imageURL: "recipe1", time: 30, rating: 4.2, saved: true, category: "Soup"),
        Recipe(name: "Fish Tacos", imageURL: "recipe1", time: 35, rating: 4.7, saved: false, category: "Mexican"),
        Recipe(name: "Pizza Margherita", imageURL: "recipe1", time: 40, rating: 4.4, saved: true, category: "Italian"),
        Recipe(name: "Chocolate Cake", imageURL: "recipe1", time: 60, rating: 4.9, saved: false, category: "Dessert")
    ]
    
    func fetchFeaturedRecipes() -> AnyPublisher<[Recipe], Error> {
        // Return first 4 recipes as featured
        let featured = Array(sampleRecipes.prefix(4))
        return Just(featured)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func fetchAllRecipes() -> AnyPublisher<[Recipe], Error> {
        return Just(sampleRecipes)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func searchRecipes(query: String) -> AnyPublisher<[Recipe], Error> {
        let filtered = sampleRecipes.filter { recipe in
            recipe.name.localizedCaseInsensitiveContains(query) ||
            (recipe.category?.localizedCaseInsensitiveContains(query) ?? false)
        }
        return Just(filtered)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func toggleSavedRecipe(recipeId: UUID) -> AnyPublisher<Bool, Error> {
        // In a real app, this would update the backend
        return Just(true)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
} 