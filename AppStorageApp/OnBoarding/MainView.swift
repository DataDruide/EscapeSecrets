//
//  OnBoardingPageTwo.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct MainView: View {
    
    @AppStorage("onBoarding")  var onBoarding = true
    
    @State private var showLoginView = false
    @State private var showSignUpView = false
    @State private var RestartOnboarding = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    @Binding var show : Bool
    @State private var imageRotation: Double = 0
    
    
    var body: some View {
        ZStack {
            Color(.systemGreen).opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                
                
                Image("studenten")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .opacity(0.5)
                    .padding(.bottom, 45)

                            
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
                                .background(Color.red).opacity(0.3)
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
                                .background(Color.red).opacity(0.3)
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
                            .background(Color.red).opacity(0.3)
                            .cornerRadius(8)
                            .padding(.bottom, 15)
                            
                            
                        }
                    }
            }
        }
