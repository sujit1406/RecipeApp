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
        ZStack(alignment: .bottom) {

            
            TabView(selection: $coordinator.selectedTab) {
                HomeView(coordinator: coordinator, appState: appState)
                    .tag(MainCoordinator.Tab.home)
                
                SavedView()
                    .tag(MainCoordinator.Tab.saved)
                
                NotificationsView()
                    .tag(MainCoordinator.Tab.notifications)
                
                ProfileView(appState: appState)
                    .tag(MainCoordinator.Tab.profile)
            }
            .toolbar(.hidden, for: .tabBar)
            .sheet(isPresented: $coordinator.showingAddRecipe) {
                AddRecipeView()
            }
            .sheet(item: $coordinator.selectedRecipe) { recipe in
                RecipeDetailView(recipe: recipe)
            }
            
            TabBarShape(insetRadius: 30)
                .frame(width: 350, height: 70)
                .foregroundColor(.white)
                .shadow(color: Color(white: 0.8), radius: 6, x: 0, y: 3)
            
            HStack {
                Button {
                    $coordinator.selectedTab.wrappedValue = .home
                } label: {
                    CustomTabItem(imageName: "home-2", title: "Home", isActive: ($coordinator.selectedTab.wrappedValue == .home))
                }
                
                Button {
                    $coordinator.selectedTab.wrappedValue = .saved
                } label: {
                    CustomTabItem(imageName: "Inactive", title: "Saved", isActive: ($coordinator.selectedTab.wrappedValue == .saved))
                }
                
                
                Button {
                    $coordinator.selectedTab.wrappedValue = .notifications
                } label: {
                    CustomTabItem(imageName: "notification-bing", title: "Notifications", isActive: ($coordinator.selectedTab.wrappedValue == .notifications))
                }
                
                
                Button {
                    $coordinator.selectedTab.wrappedValue = .profile
                } label: {
                    CustomTabItem(imageName: "profile", title: "Profile", isActive: ($coordinator.selectedTab.wrappedValue == .profile))
                }
                
            }.frame(height: 70)

            
            Button {
                coordinator.showAddRecipe()
            } label: {
                Image("addrecipe")
                    .resizable()
                    .frame(width: 48, height: 48)
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .shadow(radius: 0.8)
            .offset(y: -50)
        }
    }
}

extension MainTabView {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(alignment: .center,spacing: 22){
            Spacer()
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? Color(red: 18/255, green: 149/255, blue: 117/255) : .gray)
                .frame(width: 25, height: 25)
            Spacer()
        }
    }
}


struct TabBarShape: Shape {
    let insetRadius: CGFloat
    let cornerRadius = CGFloat(25)
    let insetCornerAngle = 45.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Start just below the top-left corner
        var x = rect.minX
        var y = rect.minY + cornerRadius
        path.move(to: CGPoint(x: x, y: y))
        
        // Add the rounded corner on the top-left corner
        x += cornerRadius
        path.addArc(
            center: CGPoint(x: x, y: y),
            radius: cornerRadius,
            startAngle: .degrees(180),
            endAngle: .degrees(270),
            clockwise: false
        )
        // Begin inset in middle, cutting into shape
        x = rect.midX - (2 * insetRadius)
        y = rect.minY + insetRadius
        path.addArc(
            center: CGPoint(x: x, y: y),
            radius: insetRadius,
            startAngle: .degrees(270),
            endAngle: .degrees(270 + insetCornerAngle),
            clockwise: false
        )
        // Add a half-circle to fit the button
        x = rect.midX
        y = rect.minY
        path.addArc(
            center: CGPoint(x: x, y: y),
            radius: insetRadius,
            startAngle: .degrees(90 + insetCornerAngle),
            endAngle: .degrees(90 - insetCornerAngle),
            clockwise: true
        )
        // Complete the inset with the second rounded corner
        x += (2 * insetRadius)
        y += insetRadius
        path.addArc(
            center: CGPoint(x: x, y: y),
            radius: insetRadius,
            startAngle: .degrees(270 - insetCornerAngle),
            endAngle: .degrees(270),
            clockwise: false
        )
        // Top-right corner
        x = rect.maxX - cornerRadius
        y = rect.minY + cornerRadius
        path.addArc(
            center: CGPoint(x: x, y: y),
            radius: cornerRadius,
            startAngle: .degrees(270),
            endAngle: .degrees(0),
            clockwise: false
        )
        // Bottom-right corner
        y = rect.maxY - cornerRadius
        path.addArc(
            center: CGPoint(x: x, y: y),
            radius: cornerRadius,
            startAngle: .degrees(0),
            endAngle: .degrees(90),
            clockwise: false
        )
        // Bottom-left corner
        x = rect.minX + cornerRadius
        path.addArc(
            center: CGPoint(x: x, y: y),
            radius: cornerRadius,
            startAngle: .degrees(90),
            endAngle: .degrees(180),
            clockwise: false
        )
        path.closeSubpath()
        return path
    }
}


#Preview {
    MainTabView(appState: AppState.shared)
}
