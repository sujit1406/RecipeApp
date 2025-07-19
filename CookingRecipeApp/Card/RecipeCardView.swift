//
//  RecipeCardView.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import SwiftUI

struct RecipeCardView: View {
    let recipe: Recipe
    let onSaveToggle: () -> Void

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(red: 217/255, green: 217/255, blue: 217/255))
                    .frame(maxWidth: .infinity)
                    .padding()

                VStack {
                    Image(recipe.imageURL)
                        .resizable()
                        .frame(width: 110, height: 110)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    Text(recipe.name)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.black)
                        .frame(width: 130, height: 42)
                    HStack{
                        VStack{
                            Text("Time")
                                .font(.system(size: 11, weight: .thin))
                                .foregroundStyle(.gray)
                                .frame(width: 50, height: 20, alignment: .leading)
                            Text("\(recipe.time) mins")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundStyle(.black)
                                .frame(width: 50, height: 20, alignment: .leading)
                        }.padding()
                        Spacer()
                        Button(action: onSaveToggle) {
                            Image(recipe.saved ? "Inactive" : "Inactive")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 24, height: 24)
                                .background(Color.white)
                                .clipShape(Circle())
                                .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
                        }
                    }
                }
                .padding(20)
                .multilineTextAlignment(.center)
            }
            .frame(width: 150, height: 231)
        }
    }
}

#Preview {
    RecipeCardView(recipe: Recipe(name: "Classic Greek Salad", imageURL: "recipe1", time: 15, rating: 4.5, saved: true), onSaveToggle: {
        
    })
}
