//
//  HomePage.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 18/06/24.
//

import SwiftUI

struct HomePage: View {
    @State var selectedTab = 0
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    HomeView(name: "", searchText: "")
                        .tag(0)
                    
                    SavedView()
                        .tag(1)
                    
                    AddRecipeView()
                        .tag(2)
                    
                    NotificationsView()
                        .tag(3)
                    
                    ProfileView()
                        .tag(4)
                }
                
                TabBarShape(insetRadius: 30)
                    .frame(width: 350, height: 70)
                    .foregroundColor(.white)
                    .shadow(color: Color(white: 0.8), radius: 6, x: 0, y: 3)
                
                Button {
                    selectedTab = 2
                } label: {
                    Image("addrecipe")
                        .resizable()
                        .frame(width: 48, height: 48)
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(radius: 0.8)
                .offset(y: -50)
                
                HStack {
                    Button {
                        selectedTab = 0
                    } label: {
                        CustomTabItem(imageName: "home-2", title: "Home", isActive: (selectedTab == 0))
                    }
                    
                    Button {
                        selectedTab = 1
                    } label: {
                        CustomTabItem(imageName: "Inactive", title: "Saved", isActive: (selectedTab == 1))
                    }
                    
                    
                    Button {
                        selectedTab = 3
                    } label: {
                        CustomTabItem(imageName: "notification-bing", title: "Notifications", isActive: (selectedTab == 3))
                    }
                    
                    
                    Button {
                        selectedTab = 4
                    } label: {
                        CustomTabItem(imageName: "profile", title: "Profile", isActive: (selectedTab == 4))
                    }
                    
                }.frame(height: 70)
            }
        }.navigationTitle("Home")
    }
}


extension HomePage {
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
    HomePage()
}
