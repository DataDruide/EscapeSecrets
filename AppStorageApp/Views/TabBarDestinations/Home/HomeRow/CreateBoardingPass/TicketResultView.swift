//
//  TicketRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 10.04.23.
//


import SwiftUI
import Foundation

struct TicketResultView: View {
    var fn: String
    var departure: Date
    var checked: Bool
    var smoker: Bool
    var pets: Bool
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Ihre Reisedaten:")
                    .font(.headline)
                   // .padding(.bottom, 20)
                    .foregroundColor(.white)
                
                
                VStack(alignment: .center) {
                    Text("Bitte kontrollieren Sie ihre Eingaben auf Fehler und wenn Sie damit fertig sind und es ist alles In Ordnung dann drücken Sie unten auf Speichern")
                        .multilineTextAlignment(.center)
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Flugnummer:")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("Abflug:")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("Gepäck:")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("Raucherzimmer:")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("Haustiere:")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        VStack(alignment: .center, spacing: 10) {
                            Text(fn)
                                .font(.subheadline)
                            Text(departure, formatter: dateFormatter)
                                .font(.subheadline)
                            Text(checked ? "Ja" : "Nein")
                                .font(.subheadline)
                            Text(smoker ? "Ja" : "Nein")
                                .font(.subheadline)
                            Text(pets ? "Ja" : "Nein")
                                .font(.subheadline)
                        }
                        .foregroundColor(.white)
                        
                        Spacer()
                        
                       
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                
                VStack() {
                    
                    // 1 Button
                    Button(action: {
                    }, label: {
                        Text("Save")
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .blur(radius: 0.5)
                            .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 16)
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
                    })
                    .shadow(radius: 10)
                   // .sheet(isPresented: $showDetailPlaceView) {
                    //    DetailPlaceView()
                    }
                }
                .padding()
                .background(Color.gray).opacity(0.68)
                    .foregroundColor(.white)
                }
        }
    }

struct TicketResultView_Previews: PreviewProvider {
    static var previews: some View {
        TicketResultView(fn: "LH1234", departure: Date(), checked: true, smoker: false, pets: true)
    }
}
