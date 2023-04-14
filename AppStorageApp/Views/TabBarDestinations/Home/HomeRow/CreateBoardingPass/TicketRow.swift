//
//  TicketRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 10.04.23.
//

import SwiftUI
import Foundation




struct TicketRow: View {
    var ticket: TravelTicket
    var addToCart: (TravelTicket) -> Void

    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.white,.mint,.black], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                VStack(alignment: .leading) {
                    Section(header: Text("Origin")) {
                        
                        Text(ticket.origin)
                            .foregroundColor(.secondary)
                        
                            .padding()
                        Section(header: Text("Destination")) {
                            Text(ticket.destination)
                                .foregroundColor(.secondary)
                            
                                .padding()
                            Section(header: Text("Flightdate")) {
                                Text("\(ticket.date, formatter: dateFormatter)")
                                    .foregroundColor(.secondary)
                                    .padding()
                                
                            }
                            Spacer()
                            Section(header: Text("Total Price")) {
                                Text("\(ticket.price, specifier: "%.2f") €")
                                    .foregroundColor(.blue)
                                    .padding()
                                
                                    .onTapGesture {
                                        addToCart(ticket)
                                    }
                            }
                        }
                    }
                }
            }
        }
    }
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}
