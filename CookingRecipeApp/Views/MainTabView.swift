//
//  MainTabView.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var coordinator = MainCoordinator()
    @ObservedObject var appState: AppState
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            HomeView(coordinator: coordinator, appState: appState)
                .tabItem {
                    Image("home-2")
                    Text("Home")
                }
                .tag(MainCoordinator.Tab.home)
            
            SavedView()
                .tabItem {
                    Image("profile")
                    Text("Saved")
                }
                .tag(MainCoordinator.Tab.saved)
            
            AddRecipeView()
                .tabItem {
                    Image("addrecipe")
                    Text("Add")
                }
                .tag(MainCoordinator.Tab.add)
            
            NotificationsView()
                .tabItem {
                    Image("notification-bing")
                    Text("Notifications")
                }
                .tag(MainCoordinator.Tab.notifications)
            
            ProfileView()
                .tabItem {
                    Image("profile")
                    Text("Profile")
                }
                .tag(MainCoordinator.Tab.profile)
        }
        .sheet(isPresented: $coordinator.showingAddRecipe) {
            AddRecipeView()
        }
        .sheet(item: $coordinator.selectedRecipe) { recipe in
            RecipeDetailView(recipe: recipe)
        }
    }
}

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
    MainTabView(appState: AppState.shared)
} 