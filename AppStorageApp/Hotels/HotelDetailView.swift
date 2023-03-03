//
//  HotelDetailView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 03.03.23.
//

import SwiftUI
import Foundation

struct HotelDetailView: View {
    let country: String
    let landmarks = [
        Landmark(name: "Brandenburger Tor", imageName: "brandenburger_tor"),
        Landmark(name: "Eiffelturm", imageName: "eiffel_tower"),
        Landmark(name: "Taj Mahal", imageName: "taj_mahal"),
        Landmark(name: "Great Wall of China", imageName: "great_wall_of_china"),
        Landmark(name: "Grand Canyon", imageName: "grand_canyon"),
    ]

    var body: some View {
        VStack {
            List{
                ForEach(landmarks) { landmark in
                    HotelView(landmark: landmark) // Für jede Sehenswürdigkeit wird eine LandmarkView erzeugt und angezeigt
                }
                
                Spacer() // Ein Abstandshalter, um die Sehenswürdigkeiten nach oben zu drücken
            }
            .navigationTitle("Sehenswürdigkeiten in \(country)") // Der Titel der Navigationsleiste
        }
    }
}

struct HotelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetailView(country: "Deutschland")
    }
}
