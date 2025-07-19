//
//  SplashView.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        ZStack {
            Image("Splash")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("chef")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                Text("100K+ Premium Recipe")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                Spacer()
                Text("Get Cooking")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.system(size: 50))
                    .frame(width: 213, height: 120)
                Text("Simple way to find Tasty Recipe")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                Spacer()
                
                Button(action: {
                    coordinator.navigateToAuth()
                }) {
                    HStack {
                        Text("Start Cooking")
                            .foregroundColor(.white)
                            .padding()
                            .fontWeight(.heavy)
                            .font(.system(size: 18))
                            .background(Color.green)
                        Image("Union")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .padding()
                    }
                }
                .background(Color.green)
                .cornerRadius(10)
                Spacer()
            }
        }
    }
}

#Preview {
    SplashView(coordinator: AppCoordinator())
} 
