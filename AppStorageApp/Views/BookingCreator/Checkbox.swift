//
//  Checkbox.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 19.03.23.
//
import SwiftUI
struct Checkbox: View {
    
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(isChecked ? Color.orange : Color.gray)
        }
    }
}
