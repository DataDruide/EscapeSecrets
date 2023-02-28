//
//  RoundedButton.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//
import SwiftUI
import Foundation

struct RoundedButton: View {
    var value: String
    
    var color: Color = .white
    var backgroundColor: Color = .green
    
    var action: () -> Void
    
    var body: some View {
        HStack {
            Button(action: self.action) {
                Text("\(self.value)")
                    .foregroundColor(self.color)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(self.backgroundColor)
                    .cornerRadius(30)
            }
        }
        
        .padding()
        
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(value: "Apply") {
            print("Clicked")
        }
    }
}
