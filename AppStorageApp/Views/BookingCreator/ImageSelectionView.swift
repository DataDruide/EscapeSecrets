//
//  ImageSelectView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 19.03.23.
//
import SwiftUI

struct ImageSelectionView: View {
    
    @State var isSelected1: Bool = false
    @State var isSelected2: Bool = false
    @State var isSelected3: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image("sitzplatz")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding()
                    .onTapGesture {
                        isSelected1.toggle()
                    }
                    .background(isSelected1 ? Color.orange : Color.white)
                Image("sitzplatz")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding()
                    .onTapGesture {
                        isSelected2.toggle()
                    }
                    .background(isSelected2 ? Color.orange : Color.white)
                Image("sitzplatz")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding()
                    .onTapGesture {
                        isSelected3.toggle()
                    }
                    .background(isSelected3 ? Color.orange : Color.white)
            }
            HStack {
                Text("Flurseite")
                    .padding(.horizontal)
                Spacer()
                Checkbox(isChecked: $isSelected1)
            }
            HStack {
                Text("Mitte")
                    .padding(.horizontal)
                Spacer()
                Checkbox(isChecked: $isSelected2)
            }
            HStack {
                Text("Fenster")
                    .padding(.horizontal)
                Spacer()
                Checkbox(isChecked: $isSelected3)
            }
            Spacer()
        }
        .background(
            Image("innenraum2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(0.25)
        )
    }
}
