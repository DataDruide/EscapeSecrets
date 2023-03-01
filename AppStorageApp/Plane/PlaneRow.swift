//
//  PlaneRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//


import SwiftUI


import SwiftUI
import Combine
import Amadeus
import Foundation


struct PlaneRow: View {
    
    // Erstellen einer Instanz von FlightSearchViewModel als StateObject, um ihre Eigenschaften zwischen den Ansichtsaktualisierungen zu erhalten
    @StateObject var viewModel = FlightSearchViewModel()
    
    // Darstellung der SwiftUI-Ansicht
    var body: some View {
        // NavigationView zur Darstellung von Navigationsleisten und -elementen
        NavigationView {
            // ZStack zur Anordnung von Elementen in einer Schichtung
           
                VStack {
                    // Button zur Auslösung der Flugsuche
                    Button(action: {
                        viewModel.fetchFlightDestinations {
                            // Completion-Handler-Funktion, um die Ansicht nach der Abfrage zu aktualisieren
                        }
                    }) {
                        Text("Fetch Flight Destinations")
                            .padding()
                            .background(Color.orange.opacity(0.5)) // Anpassung der Transparenz
                            .cornerRadius(10) // Abgerundete Ecken
                            .foregroundColor(Color.white)
                    }
                    
                    // List zur Darstellung der Flugziele
                    List(viewModel.flightDestinations) { destination in
                        // VStack zur Anordnung der Textelemente in einer vertikalen Richtung
                        VStack(alignment: .center) {
                            Text("From: \(destination.origin)")
                                .font(.headline)

                            Text("To: \(destination.destination)")                                .font(.headline)
                            Text("Departure Date: \(destination.departureDate)")
                                .font(.system(size: 16))

                            Text("Return Date: \(destination.returnDate)")
                                .font(.system(size: 14))

                            Text("Price: \(destination.price.total)")
                                .font(.system(size: 12))
                                .frame(width: 100,height: 30)
                                .background(Color.white)
                                .cornerRadius(15)
                                .foregroundColor(Color.black)

                        }
                        .padding()
                        .background(Color.orange.opacity(0.7)) // Anpassung der Transparenz
                        .cornerRadius(10) // Abgerundete Ecken
                    }
                    .padding()
                }
            }
            // Setzen des Navigations-Titels
            .navigationTitle("Flight Destinations")
        }
    }

