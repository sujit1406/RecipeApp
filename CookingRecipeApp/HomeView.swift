//
//  HomeView.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 18/06/24.
//

import SwiftUI

struct HomeView: View {
    @State var name:String
    @State var searchText:String
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    VStack{
                        Text("Hello \(name)");
                        Text("What are you cooking today?");
                    }
                    Spacer()
                    Image("Avatar")
                        .resizable()
                        .frame(width: 50, height: 50)// to be replaced by image loader
                }.padding(EdgeInsets(top: 0, leading: 30, bottom: 50, trailing: 30))
                HStack{
                    SearchView(searchText: $searchText).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                    Button {
                        
                    } label: {
                        Image("Filter").resizable();
                    }.frame(width: 40, height: 40)

                }.padding(EdgeInsets(top: 0, leading: 30, bottom: 50, trailing: 30))
                
            }
        }
    }
}

#Preview {
    HomeView(name: "Sujith", searchText: "")
}

#Preview("Off") {
    let recipe = Recipe(name: "Classic Greek Salad", imageURL: "", time: 15, rating: 4.5, saved: true)
    return RecipeCardView(recipe: recipe);
}

struct SearchView: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.gray)
            TextField("Search Recipe", text: $searchText)
            //.foregroundColor(Color.red)
            //.font(Font.custom("Papyrus", size: 16))
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.gray))
    }
}


struct CategoryCardView: View{
    let category: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
        }
    }
}

struct RecipeCardView: View {
    let recipe: Recipe

    var body: some View {

        VStack {
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(red: 217/255, green: 217/255, blue: 217/255))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding()

                VStack {
                    Image(recipe.imageURL)
                        .resizable().frame(width: 110, height: 110)
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
                        Image("Inactive")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 24, height: 24)
                            .background(Color.white)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
                    }
                }
                .padding(20)
                .multilineTextAlignment(.center)
            }
            .frame(width: 150, height: 231)
        }
    }
}

struct Recipe{
    var name: String
    var imageURL:String
    var time:Int
    var rating: Double
    var saved:Bool
}
