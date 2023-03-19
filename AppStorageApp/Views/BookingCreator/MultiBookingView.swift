//
//  MultiBookingView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 09.03.23.
//
import SwiftUI

struct MultiBookingView: View {
    @ObservedObject var viewModel = FlightSearchViewModel()
    
    var body: some View {
        ZStack {
            Image("Background_gradient")
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack {
                Text("Ihr Buchungsnavigator")
                    .foregroundColor(.orange)
                    .bold()
                
                NavigationView {
                    
                    // Hotel cards
                    VStack(spacing: 40) {
                        NavigationLink(destination: PlaneRow()) {
                            Image("flugsuche")
                                .resizable()
                        }
                        .foregroundColor(.orange)
                        NavigationLink(destination: BookingRow()) {
                            Image("reisebuchung")
                                .resizable()
                        }
                        .foregroundColor(.orange)
                        
                        NavigationLink(destination: ErgebnisRow()) {
                            Image("ticketbooking")
                                .resizable()
                        }
                        .foregroundColor(.orange)
                        
                    }
                }
                .background(.black).opacity(0.75)
            }
            .padding()
        }
    }
    
    struct MultiBookingView_Previews: PreviewProvider {
        static var previews: some View {
            MultiBookingView()
        }
    }
    
    
    
    struct ErgebnisRow: View {
        @State var ticket = CustomerFlightTicket(id: UUID(), startAirport: "", destinationAirport: "", travelDate: Date(), isRoundTrip: false)
        
        var body: some View {
            NavigationView {
                VStack {
                    FlightTicketFormView(startAirport: $ticket.startAirport, destinationAirport: $ticket.destinationAirport, travelDate: $ticket.travelDate, isRoundTrip: $ticket.isRoundTrip)
                    NavigationLink(destination: FlightTicketDetailView(ticket: ticket)) {
                        Text("Ticket anzeigen")
                    }
                }
                .navigationBarTitle("Flugticket")
            }
        }
    }
    
    
    struct ImageSelectionView_Previews: PreviewProvider {
        static var previews: some View {
            ImageSelectionView()
        }
    }
    
    struct SeatDetailView: View {
        var seat: Seat
        
        var body: some View {
            VStack {
                Text("Sitzplatz:")
                    .font(.headline)
                    .padding()
                
                Text(seat.seatNumber)
                    .font(.title)
                
                // Hier können weitere relevante Details zum ausgewählten Sitzplatz hinzugefügt werden...
            }
        }
    }
    
    struct FlightDetailView: View {
        var flight: Flight
        
        var body: some View {
            
            
            VStack {
                
                Text("Flugdetails:")
                    .font(.headline)
                    .padding()
                
                
                Text("\(flight.airlineName) \(flight.flightNumber)")
                    .font(.title)
                
                
                HStack {
                    Text(flight.departure)
                    
                    Spacer()
                    Text(flight.arrival)
                    
                }
                .padding()
                
                // Hier können weitere relevante Details zum ausgewählten Flug hinzugefügt werden...
            }
            .background(.red)
            
        }
    }
    
    
    struct FlightTicketDetailView: View {
        var ticket: CustomerFlightTicket
        
        var body: some View {
            ZStack {
                Image("ticketblanko")
                    .resizable()
                    .frame(width: 390, height: 150)
                VStack(alignment: .leading) {
                    
                    Text("Airport of departure: \(ticket.startAirport)")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                    
                    Text("Destination airport: \(ticket.destinationAirport)")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                    
                    
                    Text("Date to Travel: \(ticket.travelDate, formatter: dateFormatter)")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                    
                    
                    Text("Outward and return flights: \(ticket.isRoundTrip ? "Yes" : "No")")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                    
                    
                }
                
            }
        }
        
        private var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            return formatter
        }
    }
    
    
    
}
