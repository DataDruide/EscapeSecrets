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
            Image("Background_gradient").opacity(0.55)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Image("mountain")
                    .resizable()
                    .frame(width: 225, height: 225)
                    .opacity(0.7)
                    .padding(.top, 35)
                    .cornerRadius(110)
                
                Text("Plan your next\nStep")
                    .font(.system(size: 55))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding()
                
                
                // 1 Button
                Button(action: {
                    self.showLoginView = true
                }) {
                    Text("zum Login")
                    
                }.padding()
                    .accentColor(Color.purple)
                    .foregroundColor(.black)
                    .frame(maxWidth: 200)
                    .frame(height: 60)
                    .background(Color.purple).opacity(0.8)
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
                .background(Color.purple).opacity(0.8)
                .cornerRadius(8)
                .padding(.bottom, 15)
                
            }
            
        }
    }
}
  

