//
//  FlightTicketFormView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 09.03.23.
//

import SwiftUI

struct FlightTicketFormView: View {
    @Binding var startAirport: String
    @Binding var destinationAirport: String
    @Binding var travelDate: Date
    @Binding var isRoundTrip: Bool
    
    var body: some View {
        Form {
            TextField("Airport of departure", text: $startAirport)
            TextField("Destination airport", text: $destinationAirport)
            DatePicker("Date of travel", selection: $travelDate, displayedComponents: [.date])
            Toggle("Outward and return flights", isOn: $isRoundTrip)
        }
        .background(Image("innenraum2"))
        
    }
}
