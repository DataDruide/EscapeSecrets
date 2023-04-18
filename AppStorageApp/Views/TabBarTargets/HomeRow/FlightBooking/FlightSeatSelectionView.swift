//
//  FlightSeatSelectionView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 05.04.23.
//

import SwiftUI
struct FlightSeatSelectionView: View {
    var body: some View {
        ZStack {
            Image("airportcontrol")
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack {
                Text("Willkommen an Bord!")
                    .font(.largeTitle)
                    .padding()
                
                Text("Bitte wählen Sie Ihren gewünschten Sitzplatz aus:")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                // Hier können Sie den Sitzplan mit den verfügbaren Sitzen anzeigen lassen
                // Verwenden Sie beispielsweise Grid oder andere SwiftUI-Layouts, um die Sitzplatz-Auswahl darzustellen
                ImageSelectionView()
                Spacer()
                
                // Hier können Sie die interaktive Auswahlmöglichkeit für den Sitzplatz hinzufügen
                // Verwenden Sie beispielsweise Buttons oder Gesten, um den gewünschten Sitzplatz auszuwählen
                
                Spacer()
                
                Button(action: {
                    // Aktion ausführen, wenn der Sitzplatz ausgewählt wurde
                }) {
                    Text("Weiter")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 16)
                        .blur(radius: 0.5)
                        .shadow(color: .gray, radius: 0.25, x: 0.25, y: 0.25)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(
                                    Color(
                                        red: 75 / 255,
                                        green: 115 / 255,
                                        blue: 115 / 255
                                    )
                                )
                        )
                }
                .shadow(radius: 10)
                
                // Add CardView below the existing views
                CardViewSeat()
                    .padding()
                
            }
            .padding()
        }
        // Set the foreground color to black for all text in the view hierarchy
        .foregroundColor(.black)
    }
}

struct FlightSeatSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSeatSelectionView()
    }
}

struct CardViewSeat: View {
    var body: some View {
        VStack {
            Text("CardView")
                .font(.title)
                .foregroundColor(.white)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue)
        .cornerRadius(20)
    }
}
