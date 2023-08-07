

import SwiftUI

class Cart1: ObservableObject {
    // @Published Modifier das wir Veränderungen wahrnehmen können (Veränderungen beobachten)
    @Published var items: [Flights] = [] // Array von Flights-Objekten
    @Published var total: Int = 0 // Variable für den Gesamtpreis

    
    
    
    // Eine Methode, um einen Flugartikel zum Einkaufswagen hinzuzufügen. Der übergebene Flugartikel wird dem "items"-Array hinzugefügt, und der Preis des Artikels wird zum "total"-Wert addiert.
    
    func addFlightItem(_ item: Flights) {
        items.append(item)
        total += item.price
    }
    
    // Eine Methode, um einen Flugartikel aus dem Einkaufswagen zu entfernen. Wenn der übergebene Flugartikel im "items"-Array gefunden wird (anhand der ID des Artikels), wird er aus dem Array entfernt und der Preis des Artikels wird vom "total"-Wert abgezogen.
    
    func removeItem(_ item: Flights) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items.remove(at: index)
            total -= item.price
        }
    }
}
