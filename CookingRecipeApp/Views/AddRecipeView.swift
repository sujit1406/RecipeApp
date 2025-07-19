//
//  AddRecipeView.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import SwiftUI

struct AddRecipeView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var recipeName = ""
    @State private var cookingTime = ""
    @State private var description = ""
    @State private var ingredients = ""
    @State private var instructions = ""
    @State private var selectedCategory = "Main Course"
    
    private let categories = ["Appetizer", "Main Course", "Dessert", "Salad", "Soup", "Breakfast", "Snack"]
    
    var body: some View {
        NavigationView {
            Form {
                Section("Recipe Information") {
                    TextField("Recipe Name", text: $recipeName)
                    TextField("Cooking Time (minutes)", text: $cookingTime)
                        .keyboardType(.numberPad)
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { category in
                            Text(category).tag(category)
                        }
                    }
                }
                
                Section("Description") {
                    TextField("Recipe description", text: $description, axis: .vertical)
                        .lineLimit(3...6)
                }
                
                Section("Ingredients") {
                    TextField("Enter ingredients (one per line)", text: $ingredients, axis: .vertical)
                        .lineLimit(5...10)
                }
                
                Section("Instructions") {
                    TextField("Enter cooking instructions (one per line)", text: $instructions, axis: .vertical)
                        .lineLimit(5...15)
                }
            }
            .navigationTitle("Add Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Save") {
                    saveRecipe()
                }
                .disabled(recipeName.isEmpty || cookingTime.isEmpty)
            )
        }
    }
    
    private func saveRecipe() {
        // Here you would typically save the recipe to your data source
        // For now, we'll just dismiss the view
        dismiss()
    }
}

#Preview {
    AddRecipeView()
} 