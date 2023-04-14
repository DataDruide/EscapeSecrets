//
//  Cart1.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 30.03.23.
//

import SwiftUI

class Cart1: ObservableObject {
    @Published var items: [Flights] = []
    @Published var total: Int = 0

    func addFlightItem(_ item: Flights) {
        items.append(item)
        total += item.price
    }

    func removeItem(_ item: Flights) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items.remove(at: index)
            total -= item.price
        }
    }
}
