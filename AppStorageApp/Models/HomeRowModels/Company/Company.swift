import Foundation
import SwiftUI

// Das Modell für Unternehmen, die ein Projekt positiv bewerten.
struct Company: Hashable {
    // Der Name des Unternehmens.
    let name: String
    // Der Name des Bildes, das dem Unternehmen zugeordnet ist.
    let imageName: String
}
