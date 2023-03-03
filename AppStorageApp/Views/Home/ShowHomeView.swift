//
//  ShowHomeView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//

import SwiftUI

struct CountryDetailView: View {
    let theReise: String
    let imageName: String
    let reiseURL: String
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.7)
                .ignoresSafeArea()
            
            VStack {
                ScrollView {
                    Text(theReise)
                        .padding()
                }
                
                NavigationLink(destination: HotelDetailView(country: "Deutschland")) {
                    Text("Angeboten")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Link(
                    destination: URL(string: reiseURL)!,
                    label: {
                        ZStack {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                                .scaleEffect(0.8)
                            
                            Text("Click image for more details of Travel")
                                .foregroundColor(.orange)
                                .font(.headline)
                                .padding()
                                .background(
                                Capsule()
                                    .fill(Color.black
                                            .opacity(0.7))
                                )
                        }
                    })
                
                Spacer()
            }
        }
        .navigationTitle("Travel Details")
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(
            theReise: """
**Ingredients**
    -Deutschland gehört geologisch zu Westeuropa, das heißt zu jenem Teil des Kontinents, der dem präkambrisch konsolidierten „Ur-Europa“ (Osteuropa einschließlich eines Großteils Skandinaviens, vgl. Baltica) erst im Verlauf des Phanerozoikums sukzessive durch Kontinent-Kontinent-Kollisionen (Gebirgsbildungen) angegliedert wurde. Die entsprechenden Krustenprovinzen (Grundgebirgsprovinzen) werden klassisch vereinfachend (Ost-)Avalonia (vgl. kaledonische Gebirgsbildung) und Armorica (vgl. variszische Gebirgsbildung) genannt. Die jüngste Krustenprovinz ist das Alpen-Karpaten-Orogen (vgl. alpidische Gebirgsbildung), an dem Deutschland nur mit dem äußersten Süden Bayerns Anteil hat und das im Gegensatz zu den beiden anderen tektonischen Provinzen ein aktives Orogen darstellt
""",
            imageName: "brandenburger_tor",
            reiseURL: "https://www.visitberlin.de/de")
    }
}
