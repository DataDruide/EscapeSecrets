//
//  HotelDetailView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 03.03.23.
//

import SwiftUI

struct HotelDetailView: View {
    
    var hotel: Hotels
    
    @EnvironmentObject var hotelType : HotelTypeViewModel
    
    
    // Initialisierungsfunktion
    init(hotel:Hotels){
        self.hotel = hotel
        
    }
    
    var body: some View {
        
        VStack {
            VStack(alignment: .center, spacing: 0){
                
                Button(action: {
                    withAnimation {
                        hotelType.addHotels(newItem: hotel)
                        print("Added to the hotel booking list")
                    }
                }) {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.purple)
                        .frame(width: 120, height: 60)
                        .font(.title)
                        .overlay(HStack {
                            Text("Booking")
                                .fontWeight(.heavy)
                                .foregroundColor(Color.purple)
                        })
                }
            }.padding()
                
        }
        .background(Image("BG 1"))
    }
}
struct DetailHotelExperienceView_Previews: PreviewProvider {
    static let hotelTide = HotelTypeViewModel()
    @Namespace static var namespace

    static var previews: some View {
        HotelDetailView(hotel: hotelList[0])
            .environmentObject(hotelTide)
    }
}

