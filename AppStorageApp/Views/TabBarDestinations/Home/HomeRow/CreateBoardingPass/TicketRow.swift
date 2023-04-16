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
            LinearGradient(colors: [.black,.black,.black], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                VStack(alignment: .leading) {
                    Section(header: Text("Origin")) {
                        
                        Text(ticket.origin)
                            .foregroundColor(.white)
                        
                            .padding()
                        Section(header: Text("Destination")) {
                            Text(ticket.destination)
                                .foregroundColor(.white)
                            
                                .padding()
                            Section(header: Text("Flightdate")) {
                                Text("\(ticket.date, formatter: dateFormatter)")
                                    .foregroundColor(.white)
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



struct TicketRow_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTicket = TravelTicket(origin: "Stuttgart", destination: "Paris", date: Date(), price: 499.99)
        
        TicketRow(ticket: sampleTicket) { ticket in
            // This closure could be used to add the ticket to a shopping cart or perform some other action
            print("Ticket added to cart: \(ticket.destination)")
        }
    }
}
