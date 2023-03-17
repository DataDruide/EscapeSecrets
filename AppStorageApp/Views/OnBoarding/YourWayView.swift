//
//  OnBoardingPageTwo.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct YourWayView: View {
    
    @AppStorage("onBoarding")  var onBoarding = true
    
    
    @State private var showLoginView = false
    @State private var RestartOnboarding = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    @Binding var show : Bool
    @State private var imageRotation: Double = 0
    
    
    var body: some View {
        ZStack {
            Image("neuHinter").opacity(0.85)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("Plan your next\nStep")
                    .font(.system(size: 44))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.orange)
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
                    .background(Color.orange).opacity(0.8)
                    .cornerRadius(8)
                    .padding(.bottom, 15)
                
                
                    .sheet(isPresented: $showLoginView) {
                        LoginView()
                        
                        
                    }
                
                
                Button("Rewatch Onboarding"){
                    onBoarding.toggle()
                }
                .accentColor(Color.orange)
                .foregroundColor(.black)
                .frame(maxWidth: 200)
                .frame(height: 60)
                .background(Color.orange).opacity(0.8)
                .cornerRadius(8)
                .padding(.bottom, 15)
                
            }
            
        }
    }
}
  

