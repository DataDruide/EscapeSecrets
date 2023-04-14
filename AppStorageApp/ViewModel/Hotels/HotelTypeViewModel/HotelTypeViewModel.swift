//
//  HotelTypeViewModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//

import Foundation
import Combine
import MapKit

//MARK: MODEL VIEW

class HotelTypeViewModel : ObservableObject{
    @Published var hotelsList : [Hotels] = HotelModel().hotelsList
    @Published var hotels : [Hotels] = []
    
    @Published var total : Int = 0
    @Published var searchText : String = ""
    
    
    func addHotels(newItem: Hotels) {
       
        hotels.append(newItem)
        total += newItem.price
    }
    
    func removeFromCart (newItem: Hotels){
        
        hotels = hotels.filter{ $0.id != newItem.id}
        total -= newItem.price
    }
    
    
    
}

