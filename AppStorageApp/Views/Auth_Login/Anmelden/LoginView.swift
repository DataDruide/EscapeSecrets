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
            Image("willcomebild")
                .ignoresSafeArea()
            
            var isButtonEnabled = !email.isEmpty && !password.isEmpty
            
            VStack{
                Image("mountain")
                    .resizable()
                    .frame(width :300, height :300)
                    .opacity(0.7)
                    .padding(.top,35)
                    .cornerRadius(110)

                Text("Create a Account")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                Spacer()

                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .frame(width :370, height :45)
                    .background(.black).opacity(0.4)
                    .cornerRadius(8)
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .frame(width :360, height :45)
                    .background(.black).opacity(0.4)
                    .cornerRadius(8)
                    .padding(.top)
                    
                // ******************************************+
                
                // Registrieren Überprüfung
               
                    Button(action: {
                        
                        authService.signUp(email: email, password: password)
                        
                    }, label: {
                        
                        Text("Register")
                            .font(.system(size: 26, weight: .semibold))
                            .foregroundColor(.orange)
                            .bold()
                            .frame(maxWidth: 300)
                            .frame(height: 60)
                            .padding()
                            .padding(.bottom)
                            .cornerRadius(25)
                    })
                    .disabled(!isButtonEnabled)
                    
                    
                    // ******************************************+
                    // Login Überprüfung
                    
                    Button(action: {
                        
                        authService.signIn(email: email, password: password)
                        
                    }, label: {
                        
                        Text("Login")
                            .font(.system(size: 23, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: 300)
                            .frame(height: 60)
                            .padding(.top)
                    })
                    .disabled(!isButtonEnabled)

                Spacer(minLength: 50)
                
                Text("forget your Password")
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
