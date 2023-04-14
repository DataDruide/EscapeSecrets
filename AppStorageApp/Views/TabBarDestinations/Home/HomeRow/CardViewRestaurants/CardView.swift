//
//  CardView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 12.04.23.
//

import SwiftUI

// Eine einfache CardView, die den Inhalt, der in sie eingeschlossen ist, rahmt
struct CardView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .multilineTextAlignment(.center)
        .background(Color.gray.opacity(0.60))
        .cornerRadius(15)
        .shadow(radius: 8)
    }
}
