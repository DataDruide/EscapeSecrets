import Foundation

// Das Modell für einen Ort (Place).
struct Places: Identifiable {
    // Eine eindeutige ID, die automatisch generiert wird (UUID).
    var id = UUID()
    // Der Name des Ortes.
    let name: String
    // Eine Beschreibung des Ortes.
    let description: String
    // Der Name des Bildes, das den Ort repräsentiert.
    let image: String
}
