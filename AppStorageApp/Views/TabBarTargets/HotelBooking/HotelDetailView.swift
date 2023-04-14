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
                        
                        
                        // Beschreibung der Aktivität
                        Text(hotel.description)
                            .foregroundColor(.white)
                            .font(.headline)
                            .tracking(-1)
                            .multilineTextAlignment(.center)
                            .padding(10)
                        
                        
                        HStack {
                            // Description of Prices
                            Text("\(hotel.price)$")
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

                       
                    }.padding()
                }
            }
        }
    }

 


struct HotelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetailView(hotel: Hotels(name: "hotel1", title: "Dream Deluxe", image: "hotel1", description: "nothing", price: 299))
    }
}
