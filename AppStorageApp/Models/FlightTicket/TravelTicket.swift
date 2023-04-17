//
//  BookingModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 24.03.23.
//

//

import Foundation
import SwiftUI

//MARK: MODEL

struct TravelTicket {
    var origin: String
    var destination: String
    var date: Date
    var price: Double
}

private var ticket1 = TravelTicket(origin: "Stuttgart", destination: "New York" ,date: Date(), price: 299.00)
private var ticket2 = TravelTicket(origin: "München", destination: "Sydney" ,date: Date(), price: 399.00)
private var ticket3 = TravelTicket(origin: "Bremen", destination: "Amsterdam" ,date: Date(), price: 199.00)

struct TicketModel {
    var ticketsList : [TravelTicket] = [ticket1,ticket2,ticket3]
}
