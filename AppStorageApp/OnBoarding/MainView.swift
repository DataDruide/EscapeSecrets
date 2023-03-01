//
//  OnBoardingPageTwo.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct MainView: View {
    
    @AppStorage("onBoarding")  var onBoarding = true
    // kommt später wieder weg !!!!
    @State private var showHome = false

    @State private var showLoginView = false
    @State private var showSignUpView = false
    @State private var RestartOnboarding = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    @Binding var show : Bool
    @State private var imageRotation: Double = 0
    
    
    var body: some View {
        ZStack {
            Image("neuHinter").opacity(0.4)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("Plan your next Step")
                    .font(.system(size: 34))
                    .foregroundColor(.brown)
                    .padding()
                
                  
                        // 1 Button
                        Button(action: {
                            self.showLoginView = true
                        }) {
                            Text("zum Login")
                            
                        }.padding()
                            .accentColor(Color.orange)
                            .foregroundColor(.black)
                            .frame(maxWidth: 200)
                            .frame(height: 60)
                            .background(Color.yellow).opacity(0.5)
                            .cornerRadius(8)
                            .padding(.bottom, 15)
                        
                        
                            .sheet(isPresented: $showLoginView) {
                                LoginView()
                                
                                
                            }
                        
                        
                        // 2 Button
                        Button(action: {
                            self.showSignUpView = true
                        }) {
                            Text("zum SignUp")
                            
                        }.padding()
                            .accentColor(Color.orange)
                            .foregroundColor(.black)
                            .frame(maxWidth: 200)
                            .frame(height: 60)
                            .background(Color.yellow).opacity(0.5)
                            .cornerRadius(8)
                            .padding(.bottom, 15)
                        
                        
                            .sheet(isPresented: $showSignUpView) {
                                SignUp(show: $show)
                                
                                
                            }
                        
                        Button("Rewatch Onboarding"){
                            onBoarding.toggle()
                        }
                        .accentColor(Color.orange)
                        .foregroundColor(.black)
                        .frame(maxWidth: 200)
                        .frame(height: 60)
                        .background(Color.yellow).opacity(0.5)
                        .cornerRadius(8)
                        .padding(.bottom, 15)
                
                
                // Button kommt später wieder weg !!!!
                Button(action: {
                    self.showHome = true
                }) {
                    Text("Als Gast fortfahren")
                    
                }.padding()
                    .accentColor(Color.orange)
                    .foregroundColor(.black)
                    .frame(maxWidth: 200)
                    .frame(height: 60)
                    .background(Color.yellow).opacity(0.5)
                    .cornerRadius(8)
                    .padding(.bottom, 15)
                
                
                    .sheet(isPresented: $showHome) {
                        Home()
                        
                        
                    }
                        
                        
                    }
                }
            }
        }
  
