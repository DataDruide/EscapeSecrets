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
            TextField("Startflughafen", text: $startAirport)
            TextField("Zielflughafen", text: $destinationAirport)
            DatePicker("Reisedatum", selection: $travelDate, displayedComponents: [.date])
            Toggle("Hin- und Rückflug", isOn: $isRoundTrip)
        }
    }
}
