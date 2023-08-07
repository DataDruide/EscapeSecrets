import Foundation
import SwiftUI

// Das Modell für Länder und deren Detailansicht.
struct FavoriteTargets: Hashable, Identifiable {
    // Eine eindeutige ID, die automatisch generiert wird (UUID).
    var id = UUID()
    // Der Name des Landes.
    let name: String
    // Der Name des Bildes, das dem Land zugeordnet ist.
    let imageName: String
}
