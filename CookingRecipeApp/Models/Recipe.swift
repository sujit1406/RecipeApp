//
//  Recipe.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import Foundation

struct Recipe: Identifiable, Codable {
    let id = UUID()
    var name: String
    var imageURL: String
    var time: Int
    var rating: Double
    var saved: Bool
    var description: String?
    var ingredients: [String]?
    var instructions: [String]?
    var category: String?
    
    init(name: String, imageURL: String, time: Int, rating: Double, saved: Bool, description: String? = nil, ingredients: [String]? = nil, instructions: [String]? = nil, category: String? = nil) {
        self.name = name
        self.imageURL = imageURL
        self.time = time
        self.rating = rating
        self.saved = saved
        self.description = description
        self.ingredients = ingredients
        self.instructions = instructions
        self.category = category
    }
}
