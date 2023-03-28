//
//  TicketView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 24.03.23.
//

import SwiftUI
struct TicketView: View {
    @State var originCode: String = ""
       @State var destinationCode: String = ""
       @State var startDate: Date = Date()
       @State var endDate: Date = Date()
       @State var passengers: Int = 1
       @State var isOneWay: Bool = true
    var body: some View {
        VStack {
            Text("Flight Summary")
                .font(.title)
            HStack {
                Text("From:")
                Spacer()
                Text(originCode)
            }
            HStack {
                Text("To:")
                Spacer()
                Text(destinationCode)
            }
            HStack {
                Text("Departure:")
                Spacer()
                Text(startDate, style: .date)
            }
            HStack {
                Text("Return:")
                Spacer()
                Text(endDate, style: .date)
            }
            HStack {
                Text("Passengers:")
                Spacer()
                Text("\(passengers)")
            }
            HStack {
                Text("Trip Type:")
                Spacer()
                Text(isOneWay ? "One Way" : "Round Trip")
            }
            Spacer()
        }
        .padding()
        .background(Image("BG1"))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
