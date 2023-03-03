//
//  HotelView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//
import SwiftUI
struct HotelView: View {
    let landmark: Landmark
    @State var isSelected: Bool = false

    var body: some View {
        VStack {
            Image(landmark.imageName)
                .resizable()
                .frame(width: 200, height: 200)
                .scaledToFit()
                .overlay(
                    isSelected ?
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.red, lineWidth: 5) :
                        nil
                )

            Text(landmark.name)
                .font(.headline)
                .padding()
                .foregroundColor(isSelected ? .red : .black)
                .onTapGesture {
                    isSelected.toggle()
                }
        }
    }
}
