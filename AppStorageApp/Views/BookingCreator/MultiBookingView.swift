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



import Foundation
import SwiftUI

struct BookingRow: View {
    
    @State var selectedFlight: Flight?
    @State var selectedSeat: Seat?
    @State var checkedBags: Int = 0
    
    var body: some View {
        VStack {
            Text("Step One of your Booking Process")
            Spacer()
           
                VStack {
                    Text("Anzahl der aufgegebenen Gepäckstücke:")
                        .font(.headline)
                    
                    Stepper(value: $checkedBags, in: 0...10) {
                        Text("\(checkedBags) \(checkedBags == 1 ? "Gepäckstück" : "Gepäckstücke")")
                    }
                    .padding()
                    .foregroundColor(.white)
                }
                
                
                if selectedFlight != nil && selectedSeat != nil && checkedBags > 0 {
                    //  PaymentView
                } else {
                    Text("Bitte wählen Sie einen Sitzplatz und geben Sie die Anzahl der aufgegebenen Gepäckstücke an, um fortzufahren.")
                }
            }
            ImageSelectionView()
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


struct ImageSelectionView: View {
    
    @State var isSelected1: Bool = false
    @State var isSelected2: Bool = false
    @State var isSelected3: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image("sitzplatz")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding()
                    .onTapGesture {
                        isSelected1.toggle()
                    }
                    .background(isSelected1 ? Color.orange : Color.white)
                Image("sitzplatz")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding()
                    .onTapGesture {
                        isSelected2.toggle()
                    }
                    .background(isSelected2 ? Color.orange : Color.white)
                Image("sitzplatz")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding()
                    .onTapGesture {
                        isSelected3.toggle()
                    }
                    .background(isSelected3 ? Color.orange : Color.white)
            }
            HStack {
                Text("Flurseite")
                    .padding(.horizontal)
                Spacer()
                Checkbox(isChecked: $isSelected1)
            }
            HStack {
                Text("Mitte")
                    .padding(.horizontal)
                Spacer()
                Checkbox(isChecked: $isSelected2)
            }
            HStack {
                Text("Fenster")
                    .padding(.horizontal)
                Spacer()
                Checkbox(isChecked: $isSelected3)
            }
            Spacer()
        }
        .background(
            Image("innenraum2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(0.25)
        )
    }
}

struct Checkbox: View {
    
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(isChecked ? Color.orange : Color.gray)
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

struct Seat {
var seatNumber: String
var isBooked: Bool
// Weitere relevante Sitzplatzinformationen hinzufügen...
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



