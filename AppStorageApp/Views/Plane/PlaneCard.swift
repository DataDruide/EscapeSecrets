//
//  PlaneCard.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 02.03.23.
//

import SwiftUI
import Combine
import Amadeus
import Foundation
struct PlaneCard: View {
    @State var airportOfDeparture : String = ""
    @State var destinationAirport : String = ""
    @State var persons: String = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .frame(width: 350, height: 350) // reduzieren der Größe des Rechtecks
                .cornerRadius(20)
                .opacity(0.8)
                .overlay(
                    Rectangle()
                        .stroke(Color.black, lineWidth: 3)
                        .cornerRadius(20)
                )
            VStack() {
                
                Text("Geben sie hier ihre Daten ein")
                    .foregroundColor(.indigo)
                TextField("airportOfDeparture", text: $airportOfDeparture)
                    .background(Color.gray)
                    .cornerRadius(2)
                    .padding()
                TextField("destinationAirport", text: $destinationAirport)
                    .background(Color.gray)
                    .cornerRadius(2)
                    .padding()
                TextField("persons", text: $persons)
                    .background(Color.gray)
                    .cornerRadius(2)
                    .padding()
                Button(action: {}) {
                    Text("speichern")
                        .foregroundColor(.indigo)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 10)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
            .padding(30)
        }
    }
}

struct PlaneCard_Previews: PreviewProvider {
static var previews: some View {
PlaneCard()
    }
}

