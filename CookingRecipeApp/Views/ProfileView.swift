//
//  ProfileView.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var authViewModel = AuthViewModel()
    @ObservedObject var appState: AppState
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // Header Section
                    headerSection
                    
                    // Stats Section
                    statsSection
                    
                    // Tab Section
                    tabSection
                    
                    // Content based on selected tab
                    tabContent
                    
                    // Sign Out Button
                    signOutSection
                }
            }
            .background(Color(.systemGray6))
            .navigationBarHidden(true)
            .alert("Error", isPresented: .constant(authViewModel.errorMessage != nil)) {
                Button("OK") {
                    authViewModel.errorMessage = nil
                }
            } message: {
                Text(authViewModel.errorMessage ?? "")
            }
        }
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(spacing: 20) {
            // Profile Image and Basic Info
            VStack(spacing: 16) {
                Image("chef")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.teal, lineWidth: 4)
                    )
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                
                VStack(spacing: 8) {
                    Text(appState.currentUser?.name ?? "User")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Cooking Enthusiast")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    
                    HStack(spacing: 20) {
                        VStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("4.8")
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                        
                        VStack {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                            Text("2.1k")
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                        
                        VStack {
                            Image(systemName: "person.2.fill")
                                .foregroundColor(.blue)
                            Text("156")
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            // Bio Section
            VStack(alignment: .leading, spacing: 12) {
                Text("About Me")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text("Passionate cooking enthusiast who loves exploring new recipes and sharing culinary adventures. Always on the lookout for delicious and healthy meal ideas.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(nil)
            }
            .padding(.horizontal, 20)
            
            // Contact Info
            HStack(spacing: 30) {
                contactItem(icon: "envelope.fill", text: appState.currentUser?.email ?? "user@email.com", color: .blue)
                contactItem(icon: "phone.fill", text: "+1 (555) 123-4567", color: .green)
                contactItem(icon: "location.fill", text: "San Francisco, CA", color: .orange)
            }
            .padding(.horizontal, 20)
        }
        .background(Color.white)
        .padding(.bottom, 20)
    }
    
    // MARK: - Stats Section
    private var statsSection: some View {
        HStack(spacing: 0) {
            statCard(title: "Recipes", value: "47", icon: "book.fill", color: .teal)
            statCard(title: "Cooking Time", value: "234h", icon: "clock.fill", color: .orange)
            statCard(title: "Followers", value: "1.2k", icon: "person.2.fill", color: .blue)
            statCard(title: "Reviews", value: "56", icon: "star.fill", color: .yellow)
        }
        .background(Color.white)
        .padding(.bottom, 20)
    }
    
    // MARK: - Tab Section
    private var tabSection: some View {
        HStack(spacing: 0) {
            tabButton(title: "My Recipes", index: 0)
            tabButton(title: "Favorites", index: 1)
            tabButton(title: "Reviews", index: 2)
        }
        .background(Color.white)
        .padding(.bottom, 20)
    }
    
    // MARK: - Tab Content
    private var tabContent: some View {
        VStack(spacing: 0) {
            switch selectedTab {
            case 0:
                myRecipesContent
            case 1:
                favoritesContent
            case 2:
                reviewsContent
            default:
                myRecipesContent
            }
        }
        .background(Color.white)
    }
    
    // MARK: - My Recipes Content
    private var myRecipesContent: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20)
        ], spacing: 40) {
            ForEach(sampleRecipes, id: \.id) { recipe in
                RecipeCardView(recipe: recipe, onSaveToggle: {})
            }
        }
        .padding([.horizontal, .vertical], 20)
    }
    
    // MARK: - Favorites Content
    private var favoritesContent: some View {
        VStack(spacing: 16) {
            ForEach(sampleFavorites, id: \.id) { recipe in
                favoriteRecipeRow(recipe: recipe)
            }
        }
        .padding([.horizontal, .vertical], 20)
    }
    
    // MARK: - Reviews Content
    private var reviewsContent: some View {
        VStack(spacing: 16) {
            ForEach(sampleReviews, id: \.id) { review in
                reviewRow(review: review)
            }
        }
        .padding([.horizontal, .vertical], 20)
    }
    
    // MARK: - Sign Out Section
    private var signOutSection: some View {
        VStack(spacing: 20) {
            Button(action: {
                authViewModel.signOut()
            }) {
                HStack {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .foregroundColor(.red)
                    Text("Sign Out")
                        .foregroundColor(.red)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red.opacity(0.1))
                .cornerRadius(10)
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 20)
    }
    
    // MARK: - Helper Views
    private func contactItem(icon: String, text: String, color: Color) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(color)
                .font(.title3)
            Text(text)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
    }
    
    private func statCard(title: String, value: String, icon: String, color: Color) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(color)
                .font(.title2)
            Text(value)
                .font(.headline)
                .fontWeight(.bold)
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
    }
    
    private func tabButton(title: String, index: Int) -> some View {
        Button(action: {
            selectedTab = index
        }) {
            VStack(spacing: 8) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(selectedTab == index ? .semibold : .regular)
                    .foregroundColor(selectedTab == index ? .teal : .secondary)
                
                Rectangle()
                    .fill(selectedTab == index ? Color.teal : Color.clear)
                    .frame(height: 2)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
    }
    
    private func favoriteRecipeRow(recipe: Recipe) -> some View {
        HStack(spacing: 16) {
            Image(recipe.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(recipe.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                HStack {
                    Label("\(recipe.time) mins", systemImage: "clock")
                    Spacer()
                    Label(String(format: "%.1f", recipe.rating), systemImage: "star.fill")
                        .foregroundColor(.yellow)
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    private func reviewRow(review: Review) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image("Avatar")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(review.userName)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    HStack {
                        ForEach(0..<5) { index in
                            Image(systemName: index < review.rating ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .font(.caption)
                        }
                    }
                }
                
                Spacer()
                
                Text(review.date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Text(review.comment)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

// MARK: - Sample Data
struct Review: Identifiable {
    let id = UUID()
    let userName: String
    let rating: Int
    let comment: String
    let date: String
}

private let sampleRecipes: [Recipe] = [
    Recipe(name: "Classic Greek Salad", imageURL: "recipe1", time: 15, rating: 4.5, saved: true),
    Recipe(name: "Pasta Carbonara", imageURL: "recipe1", time: 25, rating: 4.8, saved: false),
    Recipe(name: "Chicken Curry", imageURL: "recipe1", time: 45, rating: 4.6, saved: true),
    Recipe(name: "Beef Stir Fry", imageURL: "recipe1", time: 20, rating: 4.3, saved: false)
]

private let sampleFavorites: [Recipe] = [
    Recipe(name: "Vegetable Soup", imageURL: "recipe1", time: 30, rating: 4.2, saved: true),
    Recipe(name: "Fish Tacos", imageURL: "recipe1", time: 35, rating: 4.7, saved: true),
    Recipe(name: "Pizza Margherita", imageURL: "recipe1", time: 40, rating: 4.4, saved: true)
]

private let sampleReviews: [Review] = [
    Review(userName: "John Doe", rating: 5, comment: "Amazing recipe! Will definitely make it again.", date: "2 days ago"),
    Review(userName: "Jane Smith", rating: 4, comment: "Great taste, easy to follow instructions.", date: "1 week ago"),
    Review(userName: "Mike Johnson", rating: 5, comment: "Perfect for a quick dinner. Highly recommended!", date: "2 weeks ago")
]

#Preview {
    ProfileView(appState: AppState.shared)
} 