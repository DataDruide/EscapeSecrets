//
//  FlightTypeViewModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 30.03.23.
//

import Foundation

import SwiftUI

//MARK: MODEL VIEW

class FlightTypeViewModel : ObservableObject{
    @Published var flightList : [Flights] = FlightModel().flightsList
    @Published var flights : [Flights] = []

    @Published var total : Int = 0
    @Published var searchText : String = ""
    
    
    func addFlights(newItem: Flights) {
       
        flights.append(newItem)
        total += newItem.price
    }
    
    func removeFromCart (newItem: Flights){
        
        flights = flights.filter{ $0.id != newItem.id}
        total -= newItem.price
    }
    
    
    
}

