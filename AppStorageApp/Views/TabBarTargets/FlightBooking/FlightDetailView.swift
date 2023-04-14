//
//  FlightDetailView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 30.03.23.
//

import SwiftUI

struct FlightDetailView: View {
    
    var flight: Flights
    
    @EnvironmentObject var flightType : FlightTypeViewModel
    
    
    // Initialisierungsfunktion
    init(flight:Flights){
        self.flight = flight
        
    }
    
    var body: some View {
        
        ZStack {
            
            
            LinearGradient(colors: [.black.opacity(0.97), .black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                VStack(alignment: .center, spacing:10){
                    
                    HStack(alignment: .top){
                        // Bild der Aktivität
                        Image(flight.image)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(5)
                    }
                    
                    // Name der Aktivität
                    Text(flight.name)
                        .foregroundColor(.white)
                    
                    
                    // Beschreibung der Aktivität
                    Text(flight.description)
                        .foregroundColor(.white)
                        .font(.headline)
                        .tracking(-1)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    
                    HStack {
                        // Description of Prices
                        Text("\(flight.price)$")
                            .foregroundColor(.white)
                    }
                   
                        Button(action: {
                            withAnimation {
                                flightType.addFlights(newItem: flight)
                                print("Added to the flight booking list")
                            }
                        }) {
                            Text("Booking Now")
                                .font(.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .blur(radius: 0.5)
                                .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                                .padding(.horizontal, 50)
                                .padding(.vertical, 16)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(
                                            Color(
                                                red: 255 / 255,
                                                green: 115 / 255,
                                                blue: 115 / 255
                                            )
                                        )
                                )
                        }
                        .shadow(radius: 10)
                        .padding(.top, 40)
                        .padding(.bottom, 60)
                    }
                }
            }
        }
    }


struct FlightDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetailView(flight: Flights(name: "flight1", image: "Türkiye", description: "Türkisch Airline", price: 299))
    }
}
