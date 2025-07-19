//
//  User.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id = UUID()
    var name: String
    var email: String
    var profileImageURL: String?
    var savedRecipes: [UUID] = []
    
    init(name: String, email: String, profileImageURL: String? = nil) {
        self.name = name
        self.email = email
        self.profileImageURL = profileImageURL
    }
} 