//
//  HolidayDestinationViewModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//


import Foundation

@MainActor class ReiseZieleViewModel: ObservableObject {
    @Published var reiseZieleModels: [ReiseZieleModel]
    
    init() {
        reiseZieleModels = [
            ReiseZieleModel(
                name: "Österreich",
                hotelStars: 322,
                description: """
                **Bezeichnung**
                
                - Die Alpenrepublik Ös
                """,
                reiseImage: "singapur"
            ),
            ReiseZieleModel(
                name: "Schweiz",
                hotelStars: 166,
                description: """
                **Bezeichnung**
                
                - Hotels
                """,
                reiseImage: "malaysia"
            ),
            ReiseZieleModel(
                name: "Schweden",
                hotelStars: 237,
                description: """
                **Bezeichnung**
                
                - Das
                """,
                reiseImage: "marina"
            ),
            ReiseZieleModel(
                name: "Canada",
                hotelStars: 322,
                description: """
                **Bezeichnung**
                
                - Highlights der Weltreise
                """,
                reiseImage: "trip card"
            ),
            ReiseZieleModel(
                name: "Weltreise-Kreuzfahrt",
                hotelStars: 166,
                description: """
                **Bezeichnung**
                
                - Eingeschlossene Leistungen
                """,
                reiseImage: "queenmary"
            ),
            ReiseZieleModel(
                name: "USA",
                hotelStars: 237,
                description: """
                **Bezeichnung**
                
                - Dank der Nähe zu beliebten Sehenswürdigkeiten wie Merlion Park (0,7 km) und Little India (1,5 km) können Gäste des Peninsula Hotel Singapore d
                """,
                reiseImage: "burjKahlifa"
            ),
            ReiseZieleModel(
                name: "Greece",
                hotelStars: 322,
                description: """
                **Bezeichnung**
                
                - 1 (15-ounce) can chickpeas or 1 ½ cups (250 grams) cooked chickpeas
                - 1/4 cup (60 ml) fresh lemon juice, 1 large lemon
                """,
                reiseImage: "greece"
            ),
            ReiseZieleModel(
                name: "Thailand",
                hotelStars: 166,
                description: """
                **Bezeichnung**
                
                - Über diese Unterkunft
                4 Schlafzimmer zu Hause, 4 Badezimmer, Kü
                """,
                reiseImage: "tailand"
            ),
            ReiseZieleModel(
                name: "Spanien",
                hotelStars: 237,
                description: """
                **Bezeichnung**
                
                - Über diese Unterkunft
                Schö
                HUTG-014398
                """,
                reiseImage: "spain"
            )
        ]
    }
}
