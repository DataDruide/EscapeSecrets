//
//  HotelButton.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//

import SwiftUI

struct HotelButton: View {
    var name: String
    var image: String
    var description: String
    var price: Int
    var amenities: [String]  // include amenities as a parameter
    
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(6)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}
struct HotelButton_Previews: PreviewProvider {
    static var previews: some View {
        // Beispiel-Vorschau des HotelButton
        HotelButton(name: "Italien", image: "Italien", description: "Tolles Panorama-Schloss mit großem Pool. Die Unterkunft ist von Weinbergen und Olivenhainen umgeben! Das Hotel liegt im Herzen der Toskana zwischen Florenz und Siena! Ein Bahnhof ist nur 1 km entfernt! WLAN funktioniert immer im gesamten Anwesen. Klimaanlage. 5 Doppelzimmer, 6 Badezimmer. Ein sehr großer Wohnbereich, ideal für Veranstaltungen! Viele Terrassen mit Aussicht und ein erstaunlicher großer Innenhof, von dem aus du direkten Zugang zur kleinen privaten Kirche des Schlosses hast",price: 900, amenities: ["Kamin", "Küche", "Terrasse", "WLAN"])
    }
}
