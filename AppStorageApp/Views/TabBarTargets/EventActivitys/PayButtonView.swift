//
//  PayButtonView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//

import SwiftUI

// Diese Ansicht repräsentiert einen Pay-Button
struct PayButtonView: View {
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        
        // MARK: - BODY
        
        VStack() {
            // MARK: - HEADER
            
            
            ZStack {
                CircleGroupView(ShapeColor: .green, ShapeOpacity: 0.1)
                
                Button(action: {
                    withAnimation {
                        playSound(sound: "success", type: "m4a")
                    }
                }) {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    
                    Text("Paymentprocess")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                } //: BUTTON
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .blur(radius: 0.5)
                .shadow(color: .gray, radius: 20, x: 0, y: 10)
           
            } //: VSTACK
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    isAnimating = true
                })
            })
        }
    }
}
