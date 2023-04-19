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
    
            VStack {
                HStack(spacing:20) {
                    // Bild des Elements
                    Image(hotel.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading, spacing: 10){
                        // Name des Elements
                        Text(hotel.name)
                            .bold()
                            .foregroundColor(.white)

                        // Preis des Elements
                        Text("\(hotel.price)$")
                            .foregroundColor(.white)

                    }
                    Spacer()
                    // Entfernen-Symbol, um Element aus dem Warenkorb zu entfernen
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.red)
                        .overlay(
                            Image(systemName: "trash")
                                .foregroundColor(.white)
                        )                        .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                        .onTapGesture {
                            hotelType.removeFromCart(newItem: hotel)
                        }
                        .padding()
                    
                    
                }
                .padding(.horizontal)
                .frame(maxWidth:.infinity,alignment: .leading)
            }
            .background(
                    // Ein Farbverlauf wird als Hintergrund festgelegt
                    LinearGradient(colors: [.black.opacity(0.57), .black.opacity(0.47)], startPoint: .topLeading, endPoint: .bottomLeading)
                        .edgesIgnoringSafeArea(.all)
                    
        )}
    
}


