//
//  MyFlightSearchView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 24.03.23.
//

import SwiftUI
import Foundation
import Amadeus

import SwiftUI

struct MyFlightSearchView: View {
    @StateObject var viewModel = FlightSearchViewModel()
    @State var isShowingFlightDestinations = false
    @Binding var selectedDestination: FlightDestination?
    let landmark: Landmark
    
    var body: some View {
        VStack {
            Button(action: {
                isShowingFlightDestinations = true
            }) {
                Text("Select Destination")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
            }
            .sheet(isPresented: $isShowingFlightDestinations) {
                FlightDestinationsView(flightDestinations: viewModel.flightDestinations, selectedDestination: $selectedDestination)
            }
            
            if let selectedDestination = selectedDestination {
                Text("Selected Destination: \(selectedDestination.destination)")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
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
                    }
                }
            }
            .navigationBarTitle(Text("Destinations"))
        }
    }
}

