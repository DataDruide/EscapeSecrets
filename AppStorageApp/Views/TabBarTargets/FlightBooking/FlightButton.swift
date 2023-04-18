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
        ZStack(alignment: .bottom){
        
            // Ein skalierbares Bild, das das Symbol darstellt
            Image(image)
                .resizable(resizingMode: .stretch)
                .frame(width: 400, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .blur(radius: 0.5)
                .shadow(color: .gray, radius: 20, x: 2, y: 10)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color(.yellow), lineWidth: Constants.General.lineWidth))

            Text(name)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.purple)
    
                      

                
        }
    }
}

struct FlightButton_Previews: PreviewProvider {
    static var previews: some View {
        FlightButton(name: "Lufthansa", image: "Lufthansa")
    }
}
