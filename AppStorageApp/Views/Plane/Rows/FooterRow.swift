//
//  FooterRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 24.03.23.
//
import SwiftUI

struct FooterRow: View {
    
    @StateObject var viewModel = FlightSearchViewModel()
    @State var isShowingFlightDestinations = false
    @State var selectedDestination: FlightDestination?
    @State var selectedTravelStory: String = "OneWay"

    @Binding var startAirport: String
    @Binding var destinationAirport: String
    @Binding var startToTravel: Date
    @Binding var isRoundTrip: Bool
    
    var body: some View {
        
        Form {
            
            TextField("Airport of departure", text: $startAirport)
                .foregroundColor(.black)
            TextField("Destination airport", text: $destinationAirport)
                .foregroundColor(.black)
            DatePicker("Date of travel", selection: $startToTravel, displayedComponents: [.date])
                .foregroundColor(.green)
            Toggle("Outward and return flights", isOn: $isRoundTrip)
            
            
            Button("Get flights") {
                
                viewModel.fetchFlightDestinations {
                    isShowingFlightDestinations = true
                }
            }
            .sheet(isPresented: $isShowingFlightDestinations) {
                FlightDestinationsView(flightDestinations: viewModel.flightDestinations, selectedDestination: $selectedDestination)
            }
            
            if let selectedDestination = selectedDestination {
                Text("You selected: \(selectedDestination.destination)")
            }
        }
        .padding()
        .cornerRadius(50)

    }
    
    struct FlightDestinationsView: View {
        var flightDestinations: [FlightDestination]
        @Binding var selectedDestination: FlightDestination?
        
        var body: some View {
            NavigationView {
                List(flightDestinations) { destination in
                    Button(action: {
                        selectedDestination = destination
                    }) {
                        VStack(alignment: .leading) {
                            Text(destination.destination)
                                .font(.headline)
                                .foregroundColor(.black)
                            Text("From: \(destination.origin)")
                                .foregroundColor(.black)
                            Text("Departure Date: \(destination.departureDate)")
                                .foregroundColor(.black)
                            Text("Return Date: \(destination.returnDate)")
                                .foregroundColor(.black)
                            Text("Price: \(destination.price.total)")
                                .foregroundColor(.black)
                        }
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(10)
                        .padding()
                    }
                }
                .navigationTitle("Flight Destinations")
                .padding()
            }
        }
    }
  
}
       
