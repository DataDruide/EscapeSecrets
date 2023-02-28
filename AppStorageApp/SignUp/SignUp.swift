//
//  SignUp.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct SignUp: View {

    // State Variablen weil wir ihren Wert verfolgen wollen
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var passwort = ""
    @State var repasswort = ""
    
    @State var visible = false
    @State var revisible = false
    
    @Binding var show : Bool
    
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            GeometryReader { _ in
                
                VStack {
                    
                    Image("mountain")
                        .resizable()
                        .frame(width :200, height :200)
                    
                    Text("Create a Account")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                        .padding(.top,35)
                    
                    
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color,lineWidth: 2))
                        .padding(10)
                    
                    HStack(spacing: 15) {
                        
                        VStack {
                            
                            if self.revisible{
                                TextField("Passwort", text: self.$repasswort)
                            }
                            else{
                                SecureField("Passwort", text: self.$repasswort)
                                
                            }
                        }
                        
                       
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.passwort != "" ? Color("Color") : self.color,lineWidth: 2))
                    .padding(10)
                    
                    HStack(spacing: 15) {
                        
                        VStack {
                            
                            if self.revisible{
                                TextField("Re-Passwort", text: self.$repasswort)
                            }
                            else {
                                SecureField("Re-Passwort", text: self.$repasswort)
                            }
                        }
                        
                        Button(action: {
                            self.revisible.toggle()
                        }) {
                            
                            Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                            
                                .foregroundColor(self.color)
                        }
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.passwort != "" ? Color("Color") : self.color,lineWidth: 2))
                    .padding(10)
                    
                    Button(action: {
                        self.show.toggle()
                    }){
                        Text("Register")
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.top,25)
                   
                }
                .padding(.horizontal, 25)
            }
            
            Button(action: {
                self.show.toggle()
            }) {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(Color.black)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)

    }
}

