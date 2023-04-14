//
//  DetailActivityRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//

import SwiftUI
import MapKit

struct DetailActivityRow: View {
    // Zustand von TripType wird benötigt, um Elemente aus dem Warenkorb zu entfernen
    @EnvironmentObject var tripType : TripTypeViewModel
    
    var activity : Activities
    
    var body: some View {
        ZStack {
            // Ein Farbverlauf wird als Hintergrund festgelegt
            LinearGradient(colors: [.black.opacity(0.97),.black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
              
            
            VStack {
                HStack(spacing:20) {
                    // Bild des Elements
                    Image(activity.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading, spacing: 10){
                        // Name des Elements
                        Text(activity.name)
                            .bold()
                        // Preis des Elements
                        Text("\(activity.price)$")
                    }
                    Spacer()
                    // Entfernen-Symbol, um Element aus dem Warenkorb zu entfernen
                    Image(systemName: "trash")
                        .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                        .onTapGesture {
                            tripType.removeFromCart(newItem: activity)
                        }
                        .padding()
                    
                }
                .padding(.horizontal)
                .frame(maxWidth:.infinity,alignment: .leading)
            }
        }
    }
}

struct DetailActivityRow_Previews: PreviewProvider {
        static var previews: some View {
            // Beispiel-Element, um Vorschau anzuzeigen
            DetailActivityRow(activity: activities[2])
        }
    }


