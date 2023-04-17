//
//  FlightButton.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 30.03.23.
//

import SwiftUI

struct FlightButton: View {
    
    var name : String
    var image : String
    
    var body: some View {
        
        // Ein ZStack, um das Bild und den Text-Overlay zu stapeln
        ZStack(alignment: .leading){
                // Ein skalierbares Bild, das das Symbol darstellt
                Image(image)
                .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 200)
                           .foregroundColor(.white)
            }
        }
    }
struct FlightButton_Previews: PreviewProvider {
    static var previews: some View {
        // Beispiel-Vorschau des HotelButton
        FlightButton(name: "flight1", image: "Lufthansa")
    }
}
