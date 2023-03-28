//
//  HotelListView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//

import SwiftUI

struct HotelListView: View {
    
    @StateObject var hotelType = HotelTypeViewModel()
    
    @Binding var HotelListViewisShowing : Bool
    
    // Suchtext für die Filterung der Hotels
    @State private var searchText = ""
    
    var filteredHotels: [Hotels] {
        if searchText.isEmpty {
            return hotelList
        } else {
            return hotelList.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                List(filteredHotels) { hotel in
                    NavigationLink(destination: HotelDetailView(hotel: hotel)) {
                        HotelButton(name: hotel.name, image: hotel.image)
                    }
                    .environmentObject(Cart())
                }
                .navigationTitle("Hotels")
                .searchable(text: $searchText, prompt: "type something here...")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: { self.HotelListViewisShowing.toggle() }) {
                            Image(systemName: "xmark")
                        }
                    }
                }
            }
            .background(Image("BG 1"))
        }
    }
}
struct HotelListView_Previews: PreviewProvider {
    static var previews: some View {
        HotelListView(HotelListViewisShowing: .constant(true))
    }
}

