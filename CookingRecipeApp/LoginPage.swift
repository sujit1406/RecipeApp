//
//  LoginPage.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 18/06/24.
//

import SwiftUI


let textInsets = EdgeInsets(top: 0, leading: 30, bottom: 5, trailing: 30)
struct LoginPage: View {
    
    @State var email:String;
    @State var password: String;
    
    
    var body: some View {
        NavigationView{
                VStack{
                    Text("Hello,")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 50, leading: 30, bottom: 0, trailing: 60))
            
                    
                    Text("Welcome Back")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 5, leading: 30, bottom: 50, trailing: 30))
            
                    
                    Text("Email")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 5, leading: 30, bottom: 0, trailing: 30))
                    
                    
                    TextField("Enter Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: .infinity - 30, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
                        .cornerRadius(10)
                    
                    
                    
                    Text("Enter Password")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
                    
                    
                    TextField("Enter Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
                        .cornerRadius(10)
                    
                    
                    
                    NavigationLink(destination: SignupPage(name: "", email: "", password: "", confirmPassword: "", acceptTerms: false)){
                    Text("Forgot Password?")
                        .foregroundColor(.orange)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 20, leading: 30, bottom: 20, trailing: 30))
                    }
                        
                    Button {
                        
                    } label: {
                        HStack{
                            Text("Sign In")
                                .foregroundColor(.white)
                                .padding()
                                .fontWeight(Font.Weight.heavy)
                                .font(.system(size: 18))
                                
                                .background(Color.green)
                            Image("Union").resizable().frame(width: 15,height: 15)
                                .padding()
                        }.frame(maxWidth: .infinity, alignment: .center)
                        
                    }
                    .background(Color.green)
                    .cornerRadius(10)
                    .buttonStyle(.plain)
                    .padding(EdgeInsets(top: 20, leading: 30, bottom: 20, trailing: 30))
                    
                    HStack{
                        Rectangle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 1)
                        Text("Or Sign In with").foregroundColor(Color.gray.opacity(0.5))
                        Rectangle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 1)
                    }
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
                    
                    HStack{
                        Button {
                            
                        } label: {
                            Image("GSign").resizable().frame(width: 50, height: 50)
                        }
                        
                        Button {
                            
                        } label: {
                            Image("Fsign").resizable().frame(width: 50, height: 50)
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
                    HStack{
                        Text("Dont have an account?")
                            .fontWeight(.semibold)
                        NavigationLink(destination: SignupPage(name: "", email: "", password: "", confirmPassword: "", acceptTerms: false)){
                            Text("Sign Up")
                            .fontWeight(.semibold)
                        }.foregroundColor(.orange)
                    }
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    LoginPage(email: "", password: "")
}
