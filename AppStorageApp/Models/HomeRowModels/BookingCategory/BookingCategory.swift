
import Foundation

// Das Modell für eine Buchungskategorie.
struct BookingCategory: Hashable, Identifiable {  // Hashable weil wir es in Dictoniaries oder Sets verwenden wollen
    // Eine eindeutige ID, die automatisch generiert wird (UUID).
    var id = UUID()
    // Der Name der Buchungskategorie.
    let name: String
    // Das Land, zu dem die Buchungskategorie gehört.
    let country: String
    // Der Name des Bildes, das der Buchungskategorie zugeordnet ist.
    let imageName: String
}
