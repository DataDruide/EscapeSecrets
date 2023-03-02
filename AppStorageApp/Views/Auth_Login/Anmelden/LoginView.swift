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
        
     var isButtonEnabled = !email.isEmpty && !password.isEmpty

        ZStack {
            //Background Color
            Color(.yellow).opacity(0.1)
                .ignoresSafeArea()
            Color(.orange).opacity(0.3)
                .ignoresSafeArea()
            
            
            VStack{
                
                
                Image("mountain")
                    .resizable()
                    .frame(width :200, height :200)
                
                Text("Create a Account")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .padding(.top,35)
                
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                
                
                // ******************************************+
                
                // Registrieren Überprüfung
                
                Button(action: {
                   
                    authService.signUp(email: email, password: password)
                    
                }, label: {
                    
                    Text("Register")
                        .font(.system(size: 21, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: 300)
                        .frame(height: 60)
                        .background(isButtonEnabled ? Color.orange : Color.gray)
                        .cornerRadius(8)
                        .padding(.top)
                })
                .disabled(!isButtonEnabled)
                
                
                // ******************************************+
                
                // Login Überprüfung
                
                Button(action: {
                   
                    authService.signIn(email: email, password: password)
                    
                }, label: {
                    
                    Text("Login")
                        .font(.system(size: 21, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: 300)
                        .frame(height: 60)
                        .background(isButtonEnabled ? Color.orange : Color.gray)
                        .cornerRadius(8)
                        .padding(.top)
                })
                .disabled(!isButtonEnabled)
                
                
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
