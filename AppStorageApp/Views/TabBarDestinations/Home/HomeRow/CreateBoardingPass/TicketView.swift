//
//  TicketView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 24.03.23.
//

import SwiftUI




struct TicketView: View {
    
    // wird bei aktualisierungen die andere AusgabeView auch dementsprechend ändern
    
    @ObservedObject var ticketViewModel: TicketTypeViewModel
    
    var body: some View {
        
        // Navigationsart
        NavigationStack {
            
            ZStack {
                
                // Farbenverlauf
                
                LinearGradient(colors: [.black,.black,.black], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                // einzelne Textfelder zur Usereingabe
                // und deren Überschriften und Navigation auf die Ausgabeview
                
                VStack {
                    Section(header: Text("Origin")) {
                        TextField("Enter Origin", text: $ticketViewModel.origin)
                            .background(Color.gray)
                            .cornerRadius(5)
                    }
                    
                    VStack {
                        Section(header: Text("Destination")) {
                            TextField("Enter destination", text: $ticketViewModel.destination)
                                .background(Color.gray)
                                .cornerRadius(5)
                        }
                        Section(header: Text("Date")) {
                            DatePicker(selection: $ticketViewModel.date, in: Date()..., displayedComponents: [.date]) {
                                Text("Select a date")
                                    .foregroundColor(Color.gray)
                            }
                        }
                        Section(header: Text("Price")) {
                            TextField("Enter price", value: $ticketViewModel.price, formatter: NumberFormatter())
                                .keyboardType(.decimalPad)
                                .background(Color.gray)
                                .cornerRadius(5)
                                .foregroundColor(.black)
                        }
                        NavigationLink(destination: TicketRow(ticket: TravelTicket(origin: ticketViewModel.origin, destination: ticketViewModel.destination, date: ticketViewModel.date, price: ticketViewModel.price), addToCart: { _ in })) {
                            Text("Create Ticket")
                        }
                    }
                }
                .foregroundColor(.gray)
            }
        }
    }
}




struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView(ticketViewModel: TicketTypeViewModel())
    }
}

