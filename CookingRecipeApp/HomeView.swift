//
//  HomeView.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 18/06/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @ObservedObject var coordinator: MainCoordinator
    @ObservedObject var appState: AppState
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Header section
                    HStack{
                        VStack(alignment: .leading, spacing: 5){
                            Text("Hello \(appState.currentUser?.name ?? "User")")
                                .font(.title2)
                                .fontWeight(.semibold);
                            Text("What are you cooking today?")
                                .font(.subheadline)
                                .foregroundColor(.gray);
                        }
                        Spacer()
                        Image("Avatar")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }.padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
                    
                    // Search and filter section
                    HStack{
                        SearchView(searchText: $viewModel.searchText)
                            .frame(maxWidth: .infinity)
                        Button {
                            
                        } label: {
                            Image("Filter")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(10)
                                .background(Color.gray.opacity(0.1))
                                .clipShape(Circle())
                        }
                        .frame(width: 40, height: 40)
                    }.padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
                    
                    // Featured Recipes Section
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Today's Featured")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.horizontal, 30)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 50) {
                                ForEach(viewModel.featuredRecipes) { recipe in
                                    RecipeCardView(recipe: recipe, onSaveToggle: {
                                        viewModel.toggleSavedRecipe(recipe: recipe)
                                    })
                                    .frame(width: 150, height: 280)
                                    .onTapGesture {
                                        coordinator.showRecipeDetail(recipe)
                                    }
                                }
                            }
                            .padding(.horizontal, 30)
                        }
                    }
                    
                    // All Recipes Grid Section
                    VStack(alignment: .leading, spacing: 15) {
                        Text("All Recipes")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.horizontal, 30)
                        
                        if viewModel.isLoading {
                            ProgressView()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding()
                        } else {
                            LazyVGrid(columns: [
                                GridItem(.flexible(), spacing: 40),
                                GridItem(.flexible(), spacing: 40)
                            ], spacing: 40) {
                                ForEach(viewModel.allRecipes) { recipe in
                                    RecipeCardView(recipe: recipe, onSaveToggle: {
                                        viewModel.toggleSavedRecipe(recipe: recipe)
                                    })
                                    .onTapGesture {
                                        coordinator.showRecipeDetail(recipe)
                                    }
                                }
                            }
                            .padding(.horizontal, 30)
                        }
                    }
                }
                .padding(.bottom, 30)
            }
        }
        .alert("Error", isPresented: .constant(viewModel.errorMessage != nil)) {
            Button("OK") {
                viewModel.errorMessage = nil
            }
        } message: {
            Text(viewModel.errorMessage ?? "")
        }
    }
}

#Preview {
    HomeView(coordinator: MainCoordinator(), appState: AppState.shared)
}

struct SearchView: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.gray)
            TextField("Search Recipe", text: $searchText)
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.gray))
    }
}


