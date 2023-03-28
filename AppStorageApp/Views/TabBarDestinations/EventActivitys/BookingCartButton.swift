//
//  BookingCartButton.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//

import SwiftUI

struct BookingCartButton: View {
    
    // Anzahl der Elemente im Warenkorb
    var numberOfItems : Int
    
    var body: some View {
        // Stelle einen Warenkorb-Symbol-Button auf der oberen rechten Ecke dar
        ZStack(alignment: .topTrailing){
            Image(systemName: "cart")
                .padding(.top,8)
            // Wenn es Elemente im Warenkorb gibt, zeige die Anzahl der Elemente im roten Kreis
            if numberOfItems > 0 {
                Text("\(numberOfItems)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                    .cornerRadius(50)
            // Ansonsten zeige nur das Warenkorb-Symbol
            } else {
                Image(systemName: "cart")
                    .padding(.top,8)
            }
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        BookingCartButton(numberOfItems: 1)
    }
}
