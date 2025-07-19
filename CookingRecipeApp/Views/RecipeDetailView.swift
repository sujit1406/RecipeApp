//
//  RecipeDetailView.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Image(recipe.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .clipped()
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text(recipe.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        HStack {
                            Label("\(recipe.time) mins", systemImage: "clock")
                            Spacer()
                            Label(String(format: "%.1f", recipe.rating), systemImage: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        .foregroundColor(.gray)
                        
                        if let description = recipe.description {
                            Text(description)
                                .font(.body)
                        }
                        
                        if let ingredients = recipe.ingredients {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Ingredients")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                ForEach(ingredients, id: \.self) { ingredient in
                                    HStack {
                                        Circle()
                                            .fill(Color.green)
                                            .frame(width: 8, height: 8)
                                        Text(ingredient)
                                    }
                                }
                            }
                        }
                        
                        if let instructions = recipe.instructions {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Instructions")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                ForEach(Array(instructions.enumerated()), id: \.offset) { index, instruction in
                                    HStack(alignment: .top) {
                                        Text("\(index + 1).")
                                            .fontWeight(.bold)
                                            .foregroundColor(.green)
                                        Text(instruction)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Done") {
                dismiss()
            })
        }
    }
}

#Preview {
    let sampleRecipe = Recipe(
        name: "Classic Greek Salad",
        imageURL: "recipe1",
        time: 15,
        rating: 4.5,
        saved: true,
        description: "A refreshing and healthy Greek salad with fresh vegetables and feta cheese.",
        ingredients: ["Cucumber", "Tomatoes", "Red onion", "Feta cheese", "Olives", "Olive oil", "Lemon juice", "Oregano"],
        instructions: ["Chop cucumber and tomatoes into chunks", "Slice red onion thinly", "Combine vegetables in a bowl", "Add crumbled feta cheese", "Drizzle with olive oil and lemon juice", "Sprinkle with oregano and serve"]
    )
    
    RecipeDetailView(recipe: sampleRecipe)
} 