//
//  HotelDetailView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 03.03.23.
//

import SwiftUI
import MapKit

struct HotelDetailView: View {
    
    var hotel: Hotels
    
    @EnvironmentObject var hotelType : HotelTypeViewModel
    
    
    // Initialisierungsfunktion
    init(hotel:Hotels){
        self.hotel = hotel
        
    }
    
    var body: some View {
        
        ZStack {
            
            
            LinearGradient(colors: [.black.opacity(0.97), .black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    VStack(alignment: .center, spacing:10){
                        
                        HStack(alignment: .top){
                            // Bild der Aktivität
                            Image(hotel.image)
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(5)
                        }
                        
                        // Name der Aktivität
                        Text(hotel.name)
                            .foregroundColor(.white)
                        
                        VStack(alignment: .center, spacing:10){
                            
                            // Beschreibung der Aktivität
                            Text(hotel.description)
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .tracking(-1)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal,65)
                            
                            
                            HStack {
                                // Description of Prices
                                Text("\(hotel.price)$")
                                    .foregroundColor(.white)
                            }
                            
                            
                            HStack {
                                // Description of Amenities
                                Text(hotel.amenities.joined(separator: ", "))
                                    .foregroundColor(.white)
                            }
                            
                            Button(action: {
                                withAnimation {
                                    hotelType.addHotels(newItem: hotel)
                                    print("Added to the hotel booking list")
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
                                                    red: 75 / 255,
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
                        
                        
                    }.padding()
                }
            }
        }
    }
}
 


struct HotelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetailView(hotel: Hotels(name: "Italien", title: "Schloss · Gastgeber:in ist Nicola", image: "Italien", rating: 3, description: "Tolles Panorama-Schloss mit großem Pool. Die Unterkunft ist von Weinbergen und Olivenhainen umgeben! Das Hotel liegt im Herzen der Toskana zwischen Florenz und Siena! Ein Bahnhof ist nur 1 km entfernt! WLAN funktioniert immer im gesamten Anwesen. Klimaanlage. 5 Doppelzimmer, 6 Badezimmer. Ein sehr großer Wohnbereich, ideal für Veranstaltungen! Viele Terrassen mit Aussicht und ein erstaunlicher großer Innenhof, von dem aus du direkten Zugang zur kleinen privaten Kirche des Schlosses hast", price: 900, amenities: ["Kamin", "Küche", "Terrasse", "WLAN"]))
    }
}
