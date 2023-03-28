//
//  BookingHotelsItemRows.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//

import SwiftUI


struct BookingHotelsItemRows: View {
    // Zustand von TripType wird benötigt, um Elemente aus dem Warenkorb zu entfernen
    @EnvironmentObject var hotelType : HotelTypeViewModel

    var hotel : Hotels

    var body: some View {
        HStack(spacing:20) {
            // Bild des Elements
            Image(hotel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 10){
                // Name des Elements
                Text(hotel.name)
                    .bold()
                // Preis des Elements
                Text("\(hotel.price)$")
            }
            Spacer()
            // Entfernen-Symbol, um Element aus dem Warenkorb zu entfernen
            Image(systemName: "trash")
                .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                .onTapGesture {
                    hotelType.removeFromCart(newItem: hotel)
                }
                .padding()
            
           
            }
            .padding(.horizontal)
            .frame(maxWidth:.infinity,alignment: .leading)
        }
    }


struct BookingHotelsItemRows_Previews: PreviewProvider {
    static var previews: some View {
        // Beispiel-Element, um Vorschau anzuzeigen
        BookingHotelsItemRows(hotel: Hotels(name: "hotel1", description: "nice old house", image: "hotel1", price: 299))
    }
}


