
import Foundation
import SwiftUI

// Das Modell für ein Hotel.
struct Hotels: Identifiable {
    // Eine eindeutige ID, die automatisch generiert wird (UUID).
    var id = UUID()
    // Der Name des Hotels.
    let name: String
    // Der Titel des Hotels.
    let title: String
    // Der Name des Bildes, das das Hotel repräsentiert.
    let image: String
    // Die Bewertung des Hotels.
    var rating: Int
    // Eine Beschreibung des Hotels.
    let description: String
    // Der Preis des Hotels.
    let price: Int
    // Eine Liste von Annehmlichkeiten, die das Hotel bietet.
    let amenities: [String]
}

// Fake Hoteldaten 
private var hotel1 = Hotels(name: "Italy", title: "Castle · Hosted by Nicola", image: "Italien", rating: 3, description: "Great panoramic castle with a large pool. The accommodation is surrounded by vineyards and olive groves! The hotel is located in the heart of Tuscany between Florence and Siena! A train station is just 1 km away! WiFi always works throughout the property. Air conditioning. 5 double rooms, 6 bathrooms. A very large living area, ideal for events! Many terraces with views and an amazing large courtyard that gives you direct access to the castle's small private church.", price: 900, amenities: ["Fireplace", "Kitchen", "Terrace", "WiFi"])

private var hotel2 = Hotels(name: "Canada", title: "Entire Cottage · Hosted by David", image: "Kanada", rating: 4, description: "Welcome to Muskoka A-Frame, the perfect couples' getaway or solo retreat nestled in beautiful Hidden Valley. This classic 70s A-frame has been reimagined for the modern world. Wake up to swaying treetops, whip up gourmet meals, and relax by the fire with two-story woodland views.", price: 345, amenities: ["Fireplace", "Rustic Kitchen", "Garden Terrace", "Dedicated WiFi"])

private var hotel3 = Hotels(name: "Tokyo", title: "Entire Private Accommodation · Hosted by Seadiners", image: "tokio", rating: 3, description: "3 minutes walk to Sunrise Beach. Activities include an outdoor pool, a barbecue on the Char-Broil grill, a barrel sauna with Harvia sauna heater, an indoor-outdoor hot tub with LED lights, dog departures with your dog, and surfing the sea in front of you.", price: 326, amenities: ["Open Fire", "Kitchen", "Forest", "Cable"])

private var hotel4 = Hotels(name: "Finland", title: "Entire Chalet · Hosted by Tanja", image: "Finnland", rating: 5, description: "This is a high-quality and well-equipped 4-bedroom chalet in beautiful Lapland. It is 200m to the slopes, ski bus stop next door, and Levi village 10min away. The chalet has a spacious open kitchen/lounge with large windows.", price: 141, amenities: ["Fireplace", "Kitchen", "Terrace", "WiFi"])

private var hotel5 = Hotels(name: "South Korea", title: "Private Host", image: "Suedkorea", rating: 4, description: "Hanok Stay Emotional Day is located in the center of Taejo-ro, Jeonju Hanok Village. Nearby attractions (Concubine, Jeonjeon Cathedral, Gyeonggi Pre-Gyeonggi, Hyanggyo, etc.) are 5 minutes away. It is located next to the main street with many food stalls, and it is a clean and pretty single-family Hangok stay.", price: 188, amenities: ["Fireplace", "Kitchen", "Terrace", "WiFi"])

private var hotel6 = Hotels(name: "Costa Rica", title: "Entire Villa · Hosted by Petra", image: "CostaRica", rating: 5, description: "Cross the boundaries between indoor and outdoor. Slide the walls, slip through, and see the striking expanse of the outside world. Located right above the beautiful beach with ocean views and jungle. Recently featured in Wall Paper, Dezeen, etc.", price: 755, amenities: ["Bungalow", "Locals", "Garden", "WiFi"])







// gefüllte HotelListe mit den oben aufgeführten Hotels
struct HotelModel {
    
    var hotelsList : [Hotels] = [hotel1,hotel2,hotel3,hotel4,hotel5,hotel6]
    
}
