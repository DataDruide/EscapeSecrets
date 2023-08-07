import Foundation
import SwiftUI

// Das Modell für ein Reiseticket.
struct TravelTicket {
    // Der Abfahrtsort des Tickets.
    var origin: String
    // Das Ziel des Tickets.
    var destination: String
    // Das Datum der Reise.
    var date: Date
    // Der Preis des Tickets.
    var price: Double
}

// Erstelle einige Beispiel-Tickets mit verschiedenen Werten.
private var ticket1 = TravelTicket(origin: "Stuttgart", destination: "New York", date: Date(), price: 299.00)
private var ticket2 = TravelTicket(origin: "München", destination: "Sydney", date: Date(), price: 399.00)
private var ticket3 = TravelTicket(origin: "Bremen", destination: "Amsterdam", date: Date(), price: 199.00)

// Das Modell für die Liste von Reisetickets.
struct TicketModel {
    // Eine Liste von Reisetickets.
    var ticketsList: [TravelTicket] = [ticket1, ticket2, ticket3]
}
