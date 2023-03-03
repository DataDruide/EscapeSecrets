//
//  SplashView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.05
    
    @State var show = false

    var body: some View {
        if isActive {
            ContentView(show: $show)
        } else {
            ZStack {
                Image("willcomebild")
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Text("Take Off\nand find Out.....")
                            .font(Font.custom("Baskerville-Bold",
                                              size: 40))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.orange)
                        
                        // Aufruf GifImage 
                        
                        GifImage("logo")
                                       .frame(width: 200, height: 200)
                                       .opacity(0.1)
                                       .cornerRadius(100)
                                       
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 0.8
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
