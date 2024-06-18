//
//  SignupPage.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 18/06/24.
//

import SwiftUI

struct SignupPage: View {
    @State var name:String;
    @State var email:String;
    @State var password: String;
    @State var confirmPassword: String;
    @State var acceptTerms: Bool;
    var body: some View {
        NavigationView{
                VStack{
                    Text("Create an account")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 60))
                        .font(.system(size: 20))
                        .fontWeight(Font.Weight.bold)
            
                    
                    Text("Let's help you setup your account,\nIt wont take long")
                        .frame(maxWidth: .infinity, minHeight: 30, alignment: .leading)
                        .font(.system(size: 11))
                        .lineLimit(2)
                        .fontWeight(.regular)
                        .padding(EdgeInsets(top: 5, leading: 30, bottom: 20, trailing: 30))
            
                    
                    Text("Name")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                    
                    
                    TextField("Enter Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: .infinity - 30, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
                        .cornerRadius(10)
                    
                    Text("Email")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                    
                    
                    TextField("Enter Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: .infinity - 30, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
                        .cornerRadius(10)
                    
                    
                    
                    Text("Password")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                    
                    
                    SecureField("Enter Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
                        .cornerRadius(10)
                    
                    Text("Confirm Password")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                    
                    
                    SecureField("Retype Password", text: $confirmPassword)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 15, trailing: 30))
                        .cornerRadius(10)
                    
                    
                    
                    HStack{
                        if(acceptTerms == true){
                            Rectangle().fill().frame(width: 20, height: 20).foregroundColor(.orange).onTapGesture {
                                acceptTerms.toggle()
                            }
                        } else {
                            Rectangle().stroke(lineWidth: 1).frame(width: 20, height: 20).foregroundColor(.orange).onTapGesture {
                                acceptTerms.toggle()
                            }
                        }
                        Text("Accept terms & Condition")
                            .foregroundColor(.orange)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                    }.padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                    
                        
                    Button {
                        if(!name.isEmpty && !password.isEmpty && !password.isEmpty && !confirmPassword.isEmpty && password == confirmPassword){
                            print("signup with new credentials")
                        }
                        else{
                            print("signup error")
                        }
                        
                    } label: {
                        HStack{
                            Text("Sign Up")
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
                        Text("Already a member?")
                            .fontWeight(.semibold)
                        NavigationLink(destination: LoginPage(email: "", password: "")){
                            Text("Sign In")
                            .fontWeight(.semibold)
                        }.foregroundColor(.orange)
                    }
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    SignupPage(name: "", email: "", password: "", confirmPassword: "", acceptTerms: false)
}
