//
//  FooterRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 24.03.23.
//
import SwiftUI

struct FooterRow: View {
    @State private var from: String = ""
    @State private var to: String = ""
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var passengers: Int = 1
    @State private var isOneWay: Bool = true

    var body: some View {
        VStack {
            TextField("From", text: $from)
            TextField("To", text: $to)
            DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
            DatePicker("End Date", selection: $endDate, displayedComponents: .date)
            Stepper(value: $passengers, in: 1...10) {
                Text("Passengers: \(passengers)")
            }
            Toggle("One Way", isOn: $isOneWay)
        }
    }
}

