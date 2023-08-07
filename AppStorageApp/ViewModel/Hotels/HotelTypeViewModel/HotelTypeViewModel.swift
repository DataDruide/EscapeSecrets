import Foundation
import Combine
import MapKit

// ViewModel für die Model View des Hoteltyps
class HotelTypeViewModel : ObservableObject {
    // @Published-Array für die vollständige Liste von Hotels
    @Published var hotelsList : [Hotels] = HotelModel().hotelsList
    // @Published-Array für die ausgewählten Hotels (Hotels, die zur Buchung hinzugefügt wurden)
    @Published var hotels : [Hotels] = []
    // @Published-Integer für die Gesamtsumme der Preise der ausgewählten Hotels
    @Published var total : Int = 0
    // @Published-String für die Sucheingabe
    @Published var searchText : String = ""
    
    // Funktion zum Hinzufügen eines Hotels zur Buchung
    func addHotels(newItem: Hotels) {
        // Das neue Hotel zur Hotel-Liste der Buchung hinzufügen
        hotels.append(newItem)
        // Den Preis des neuen Hotels zur Gesamtsumme hinzufügen
        total += newItem.price
    }
    
    // Funktion zum Entfernen eines Hotels aus der Buchung
    func removeFromCart (newItem: Hotels){
        // Das Hotel aus der Hotel-Liste der Buchung filtern und entfernen
        hotels = hotels.filter{ $0.id != newItem.id}
        // Den Preis des entfernten Hotels von der Gesamtsumme abziehen
        total -= newItem.price
    }
}
