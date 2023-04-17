//
//  HotelButton.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//

import SwiftUI

struct HotelButton: View {
    
    var name : String
    var image : String
    
    var body: some View {
        
        // Ein ZStack, um das Bild und den Text-Overlay zu stapeln
        ZStack(alignment: .bottom){
        
            // Ein skalierbares Bild, das das Symbol darstellt
            Image(image)
                .frame(width: 200, height: 200)
                .aspectRatio(contentMode: .fit)
                //
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .blur(radius: 0.5)
                .shadow(color: .gray, radius: 5, x: 1, y: 5)
               // .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.orange)))
                

            // Ein Rechteck, um den Text zu überlagern
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 150, height: 50)
                .background(Color.gray)
                .cornerRadius(40)
                .overlay(
                    Text(name)
                       .foregroundColor(.white)
                       .bold()
                       .blur(radius: 0.5)
                      

                       // .font(.caption)
                       // .fontWeight(.bold)
                
        )}
    }
}

struct HotelButton_Previews: PreviewProvider {
    static var previews: some View {
        // Beispiel-Vorschau des HotelButton
        HotelButton(name: "hotel1", image: "hotel1")
    }
}
