//
//  SavedView.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import SwiftUI

struct SavedView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.allRecipes.filter({ $0.saved }).isEmpty {
                    emptyStateView
                } else {
                    savedRecipesList
                }
            }
            .navigationTitle("Saved Recipes")
            .onAppear {
                viewModel.loadData()
            }
        }
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 20) {
            Image(systemName: "heart")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            
            Text("No Saved Recipes")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Save your favorite recipes to see them here")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var savedRecipesList: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 20),
                GridItem(.flexible(), spacing: 20)
            ], spacing: 20) {
                ForEach(viewModel.allRecipes.filter { $0.saved }, id: \.id) { recipe in
                    RecipeCardView(recipe: recipe, onSaveToggle: {
                        viewModel.toggleSavedRecipe(recipe: recipe)
                    })
                }
            }
            .padding()
        }
    }
}

#Preview {
    SavedView()
} 