//
//  SplashView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @State private var scale: CGFloat = 0.8
    @State private var opacity: Double = 0.05
    @State private var isZoomed = false

    @State var show = false
    
    var body: some View {
        if isActive {
            ContentView(show: $show)
        } else {
            ZStack {
                Image("willcomebild")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                    .animation(.easeInOut(duration: 1.9))
                    .transition(.scale)
               
                
                VStack {
                    Text("Travel\nwith us")
                        .font(Font.custom("Baskerville-Bold",
                                          size: 60))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.orange)
                   
                }
                .foregroundColor(.white)
                .scaleEffect(scale)
                .opacity(opacity)
                .animation(.easeInOut(duration: 1.2))
                .onAppear {
                    self.scale = 1.0
                    self.opacity = 1.0
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}
