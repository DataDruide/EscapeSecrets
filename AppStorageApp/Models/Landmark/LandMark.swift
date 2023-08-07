
import Foundation

// Das Modell für eine Landmarke.
struct Landmark: Identifiable {
    // Eine eindeutige ID, die automatisch generiert wird (UUID).
    let id = UUID()
    // Der Name der Landmarke.
    let name: String
    // Der Name des Bildes, das der Landmarke zugeordnet ist.
    let imageName: String
}
