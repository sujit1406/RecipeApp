//
//  ContentView.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 18/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Image("Splash").resizable()
                
                VStack {
                    Spacer()
                    Image("chef")
                        .resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100).padding()
                    Text("100K+ Premium Recipe").foregroundColor(.white)
                        .font(.system(size: 18))
                    Spacer()
                    Text("Get Cooking").font(.largeTitle).foregroundColor(.white).fontWeight(Font.Weight.heavy)
                        .font(.system(size: 50))
                        .frame(width: 213, height: 120)
                    Text("Simple way to find Tasty Recipe").foregroundColor(.white)
                        .font(.system(size: 16))
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        NavigationLink(destination: LoginPage(email: "", password: "")) {
                            HStack{
                                Text("Start Cooking")
                                    .foregroundColor(.white)
                                    .padding()
                                    .fontWeight(Font.Weight.heavy)
                                    .font(.system(size: 18))
                                    .background(Color.green)
                                Image("Union").resizable().frame(width: 15,height: 15)
                                    .padding()
                            }
                        }
                    })
                    .background(Color.green)
                    .cornerRadius(10)
                    Spacer()
                    
                }
                
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
