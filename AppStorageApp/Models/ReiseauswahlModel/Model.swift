import Foundation

// Das Modell für ein allgemeines Element.
struct Model: Identifiable {
    // Eine eindeutige ID, die automatisch generiert wird (UUID als String).
    var id = UUID().uuidString
    // Der Titel oder Name des Elements.
    var title: String
    // Das Land, zu dem das Element gehört.
    var country: String
    // Die Bewertung des Elements als String.
    var ratings: String
    // Der Preis des Elements als String.
    var price: String
    // Der Name des Bildes, das dem Element zugeordnet ist, als String.
    var img: String
}
