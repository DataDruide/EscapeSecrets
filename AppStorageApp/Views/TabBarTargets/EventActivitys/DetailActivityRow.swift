//
//  DetailActivityRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//

import SwiftUI
import MapKit

import SwiftUI
import MapKit

struct DetailActivityRow: View {
    // Zustand von TripType wird benötigt, um Elemente aus dem Warenkorb zu entfernen
    @EnvironmentObject var tripType: TripTypeViewModel
    
    var activity: Activities
    
    var body: some View {
        ZStack {
            // Ein Farbverlauf wird als Hintergrund festgelegt
            LinearGradient(colors: [.black.opacity(0.57), .black.opacity(0.47)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 10) {
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.4)
                    .frame(height: 1)
                
                HStack(spacing: 20) {
                    // Bild des Elements
                    Image(activity.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        // Name des Elements
                        Text(activity.name)
                            .bold()
                            .foregroundColor(.white)
                        
                        // Preis des Elements
                        Text("\(activity.price)$")
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    // Entfernen-Symbol, um Element aus dem Warenkorb zu entfernen
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.red)
                        .overlay(
                            Image(systemName: "trash")
                                .foregroundColor(.white)
                        )
                        .foregroundColor(Color.gray)
                        .onTapGesture {
                            tripType.removeFromCart(newItem: activity)
                        }
                        .padding()
                }
                .padding(.horizontal)
            }
        }
    }
}

struct DetailActivityRow_Previews: PreviewProvider {
    static var previews: some View {
        // Beispiel-Element, um Vorschau anzuzeigen
        DetailActivityRow(activity: activities[2])
            .environmentObject(TripTypeViewModel())
    }
}
