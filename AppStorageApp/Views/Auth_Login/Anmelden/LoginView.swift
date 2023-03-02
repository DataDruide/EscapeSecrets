//
//  LoginView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//
import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authService : AuthService
    @State var email : String = ""
    @State var password : String = ""
    
    var body: some View {
        ZStack {
            Image("loginhintergrund")
                
            VStack{
                
                
                Image("mountain")
                    .resizable()
                    .frame(width :200, height :200)
                
                Text("Create a Account")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .padding(.top,35)
                
                
                FormField(image: "envelope", placeholder: "example@email.com", isSecure: false)
                
                FormField(image: "lock", placeholder: "password", isSecure: true)
                    .padding(.top)

                Button("Register"){
                    authService.signUp(email: email, password: password)
                }
                Button("Log In"){
                    authService.signIn(email: email, password: password)
                
                }
            
                NavigationLink(destination: HomeRow()) {
                    
                    Text("Login")
                        .font(.system(size: 21, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: 300)
                        .frame(height: 60)
                        .background(Color.orange)
                        .cornerRadius(8)
                        .padding(.top)
                }
                
                
                HStack(spacing: 15) {
                    Button(action: {}, label: {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(height: 60)
                            .foregroundColor(.white)
                            .overlay(
                                HStack {
                                    Image("facebook")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color(#colorLiteral(red: 0.2505864799, green: 0.224209547, blue: 0.5444943309, alpha: 1)))
                                    
                                    Text("Sign Up")
                                        .font(.system(size: 21, weight: .bold))
                                        .foregroundColor(.black)
                                        .padding(.leading, 8)
                                }
                            )
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0.0, y: 0.0)
                    })
                    
                    Button(action: {}, label: {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(height: 60)
                            .foregroundColor(.white)
                            .overlay(
                                HStack {
                                    Image("google")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                    
                                    Text("Sign Up")
                                        .font(.system(size: 21, weight: .bold))
                                        .foregroundColor(.black)
                                        .padding(.leading, 8)
                                }
                            )
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0.0, y: 0.0)
                    })
                }
                .padding(.top)
                
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
