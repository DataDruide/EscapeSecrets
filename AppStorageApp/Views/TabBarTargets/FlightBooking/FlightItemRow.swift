//
//  FlightItemRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 30.03.23.
//

import SwiftUI

struct FlightItemRow: View {
    // Zustand von TripType wird benötigt, um Elemente aus dem Warenkorb zu entfernen
    @EnvironmentObject var flightType : FlightTypeViewModel
    
    var flight : Flights
    
    var body: some View {
        
     
            HStack() {
                // Bild des Elements
                Image(flight.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding()
                    .frame(width: 300, height: 250)
                    .cornerRadius(2)
                
                VStack(alignment: .leading, spacing: 10){
                    // Name des Elements
                    Text(flight.name)
                        .bold()
                        .foregroundColor(.white)

                    // Preis des Elements
                    Text("\(flight.price)$")
                        .foregroundColor(.white)

                }
                Spacer()
                // Entfernen-Symbol, um Element aus dem Warenkorb zu entfernen
                Image(systemName: "trash")
                    .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                    .onTapGesture {
                        flightType.removeFromCart(newItem: flight)
                    }
                    .padding()
                
                
            }
            .padding(.horizontal)
            .frame(maxWidth:.infinity,alignment: .leading)
        }
    }
    


