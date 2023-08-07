import Foundation
import SwiftUI

// Das Modell für ein Feedback.
struct Feedback: Identifiable {
    // Eine eindeutige ID, die automatisch generiert wird (UUID).
    var id = UUID()
    // Der Titel des Feedbacks.
    var title: String
    // Der Text des Feedbacks.
    var text: String
}
