import Foundation
import SwiftUI

// ViewModel für die Model View des Flugtyps
class FlightTypeViewModel : ObservableObject {
    // @Published-Array für die vollständige Liste von Flügen
    @Published var flightList : [Flights] = FlightModel().flightsList
    // @Published-Array für die ausgewählten Flüge (Flüge, die zur Buchung hinzugefügt wurden)
    @Published var flights : [Flights] = []
    // @Published-Integer für die Gesamtsumme der Preise der ausgewählten Flüge
    @Published var total : Int = 0
    // @Published-String für die Sucheingabe
    @Published var searchText : String = ""
    
    // Funktion zum Hinzufügen eines Fluges zur Buchung
    func addFlights(newItem: Flights) {
        // Den neuen Flug zur Flug-Liste der Buchung hinzufügen
        flights.append(newItem)
        // Den Preis des neuen Fluges zur Gesamtsumme hinzufügen
        total += newItem.price
    }
    
    // Funktion zum Entfernen eines Fluges aus der Buchung
    func removeFromCart (newItem: Flights){
        // Den Flug aus der Flug-Liste der Buchung filtern und entfernen
        flights = flights.filter{ $0.id != newItem.id}
        // Den Preis des entfernten Fluges von der Gesamtsumme abziehen
        total -= newItem.price
    }
}
