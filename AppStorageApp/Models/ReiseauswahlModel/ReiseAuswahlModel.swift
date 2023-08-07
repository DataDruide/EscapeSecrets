
import Foundation

// Das Modell für die Reiseauswahl.
struct ReiseAuswahlModel: Identifiable {
    // Eine eindeutige ID, die automatisch generiert wird (UUID).
    let id = UUID()
    // Der Name des Modells.
    var name: String
    // Der Name der Reise.
    var reise: String
    // Der Name des Bildes, das der Reise zugeordnet ist.
    var reiseImage: String
    // Die URL der Reise als String.
    var reiseURL: String
}
