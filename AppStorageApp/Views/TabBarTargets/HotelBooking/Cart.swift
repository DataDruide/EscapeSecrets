

import SwiftUI

class Cart: ObservableObject {
    @Published var items: [Hotels] = []
    @Published var total: Int = 0

    func addHotelItem(_ item: Hotels) {
        items.append(item)
        total += item.price
    }

    func removeItem(_ item: Hotels) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items.remove(at: index)
            total -= item.price
        }
    }
}
