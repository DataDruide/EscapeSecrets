//
//  FlightSearchViewModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI
import Combine
import Amadeus
import Foundation

class FlightSearchViewModel: ObservableObject {
    
    // Amadeus-Objekt wird instanziert für den API-Zugriff und API KEY und SecretKey abgelegt
    private let amadeus = Amadeus(
        client_id: ApiKeys().client_id,
        client_secret: ApiKeys().client_secret
    )
    
    // Die Flugziele, die aus der API-Anfrage zurückgegeben werden, werden hier gespeichert
    @Published var flightDestinations = [FlightDestination]()
    @Published var destinationCode: String = "" // Neues @Published property hinzufügen
    @Published var originCode: String = "" // Neues @Published property hinzufügen

    // Methode zum Abrufen der Flugziele aus der Amadeus-API
    func fetchFlightDestinations(completion: @escaping () -> Void) {
        amadeus.shopping.flightDestinations.get(params: ["origin": "MAD", "oneWay": "false", "nonStop": "false"]) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    // Die JSON-Daten werden decodiert und in das "flightDestinations"-Array gespeichert
                    let jsonDecoder = JSONDecoder()
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: response.data.rawValue, options: [])
                        let decodedData = try jsonDecoder.decode([FlightDestination].self, from: jsonData)
                        self.flightDestinations = decodedData
                    } catch let error {
                        print("Error decoding flight destinations: \(error)")
                    }
                    completion()
                }
            case .failure(let error):
                print("Error fetching flight destinations: \(error)")
                completion()
            }
        }
    }
}

// Das FlightDestination-Struct wird verwendet, um die aus der API-Anfrage zurückgegebenen Flugziele zu decodieren
struct FlightDestination: Codable, Identifiable {
    let id = UUID()
    let type: String
    let origin: String
    let destination: String
    let departureDate: String
    let returnDate: String
    let price: Price
}

// Das Price-Struct wird verwendet, um die Preisinformationen für ein Flugziel zu decodieren
struct Price: Codable {
    let total: String
}
    
// Das Analytics-Struct wird verwendet, um die aus der API-Anfrage zurückgegebenen Analytics-Daten zu decodieren
struct Analytics: Decodable {
    let flights: Flights
}

// Das Flights-Struct wird verwendet, um die Flug-Statistikdaten in den Analytics-Daten zu decodieren
struct Flights: Decodable {
    let score: Double
    let travelers: [String: Double]
    
    // Hier wird das CodingKey-Enum verwendet, um die Schlüsselnamen der JSON-Daten anzupassen
    private enum CodingKeys: String, CodingKey {
        case score
        case travelers = "travelers_distribution"
    }
}
