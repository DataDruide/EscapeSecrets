//
//  SplashView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Image("willcomebild")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                    .animation(.easeInOut(duration: 1.9))
                    .transition(.scale)
                
                VStack {
                    Spacer()
                    Image("neuMap")
                        .resizable()
                           .scaledToFit()
                           .frame(width: 150, height: 150)
                           .foregroundColor(.blue)
                           .scaleEffect(isActive ? 1.2 : 0.6)
                           .animation(Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true))
                           .onAppear {
                               DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                   withAnimation {
                                       self.isActive = true
                                   }
                               }
                           }
                    Spacer()
                }
            }
        }
    }
}
