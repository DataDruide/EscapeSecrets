//
//  OnBoardingPageTwo.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct AfterOnBoarding: View {
    
    @AppStorage("onBoarding")  var onBoarding = true
    
    
    @State private var showLoginView = false
    @State private var RestartOnboarding = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    @State private var imageRotation: Double = 0
    
    
    var body: some View {
        ZStack {
            
            Image("studentonroad")
                .resizable()
                .scaledToFill()
                .overlay(Rectangle())
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.black.opacity(0.55))
                .contrast(0.7)
                .offset(x: -110)
                .opacity(01.05)

            VStack(spacing: 40) {
                
                Text("Explore ...")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.system(size: 38, weight: .regular))
                    .foregroundColor(.black.opacity(1.00))
                    .padding()
                
                Spacer()
                
                Image("neuMap")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .opacity(1.05)
                    .blur(radius: 0.5)
                    .shadow(color: .gray, radius: 0.65, x: 0.35, y: 0.35)
                    .padding(.bottom, 50)
                
                Text("Hello\nCan I help You?........")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .fontWeight(.thin)
                    .padding()
                
                Spacer()
                
                // 1 Button
                Button(action: {
                    self.showLoginView = true
                }, label: {
                    Text("Explore")
                        .font(.headline)
                        .foregroundColor(.white)
                        .blur(radius: 0.5)
                        .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(
                                    Color(
                                        red: 255 / 255,
                                        green: 115 / 255,
                                        blue: 115 / 255
                                    )
                                )
                        )
                })
                .shadow(radius: 10)
                .sheet(isPresented: $showLoginView) {
                    LoginView()
                }
               
            }
        }
    }
}

struct AfterOnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        AfterOnBoarding()
    }
}

