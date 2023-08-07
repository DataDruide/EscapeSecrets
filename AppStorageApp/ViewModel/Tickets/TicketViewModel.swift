
import Foundation
import Combine
import MapKit

//MARK: MODEL VIEW
// Ist für die Erstellung des Tickets da
// Geben ihr mit ObservableObject die Aufgabe bestimmte Views zu überwachen
class TicketTypeViewModel: ObservableObject {
    
    // machen die variablen zugänglich 
    @Published var origin: String = ""
    @Published var destination: String = ""
    @Published var date: Date = Date()
    @Published var price: Double = 0.0



}


