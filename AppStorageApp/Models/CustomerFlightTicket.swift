//
//  CustomerFlightTicket.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 09.03.23.
//


import Foundation
import SwiftUI

struct CustomerFlightTicket : Identifiable, Hashable {
    var id = UUID()
    
    var startAirport: String
    var destinationAirport: String
    var travelDate: Date
    var isRoundTrip: Bool
    // Weitere Eigenschaften können hinzugefügt werden
}
