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
                
                - Die Alpenrepublik Österreich steht für Sport und Schnee soweit das Auge reicht, die Idylle ist einfach einzigartig und auch die Reichen verlaufen sich regelmäßig hierher.
                
                - Deshalb haben wir hiermit genau das richtige für Sie 12 Wochen 4 Sterne mit All Inclusiv und einen Job mit dazu als Hausmeister in unserem Haus helfen sie wo sie halt gebraucht werden 
                """,
                reiseImage: "singapur",
                reiseURL: "https://www.example.com/TOS.html"
            ),
            ReiseZieleModel(
                name: "Schweiz",
                hotelStars: 166,
                description: """
                **Bezeichnung**
                
                - Hotels
                """,
                reiseImage: "malaysia",
                reiseURL: "https://www.example.com/TOS.html"
            ),
            ReiseZieleModel(
                name: "Schweden",
                hotelStars: 237,
                description: """
                **Bezeichnung**
                
                - Das
                """,
                reiseImage: "marina",
                reiseURL: "https://www.example.com/TOS.html"
            ),
            ReiseZieleModel(
                name: "Canada",
                hotelStars: 322,
                description: """
                **Bezeichnung**
                
                - Highlights der Weltreise
                """,
                reiseImage: "trip card",
                reiseURL: "https://www.example.com/TOS.html"
            ),
            ReiseZieleModel(
                name: "Weltreise-Kreuzfahrt",
                hotelStars: 166,
                description: """
                **Bezeichnung**
                
                - Eingeschlossene Leistungen
                """,
                reiseImage: "queenmary",
                reiseURL: "https://www.example.com/TOS.html"
            ),
            ReiseZieleModel(
                name: "USA",
                hotelStars: 237,
                description: """
                **Bezeichnung**
                
                - Dank der Nähe zu beliebten Sehenswürdigkeiten wie Merlion Park (0,7 km) und Little India (1,5 km) können Gäste des Peninsula Hotel Singapore d
                """,
                reiseImage: "burjKahlifa",
                reiseURL: "https://www.inspiredtaste.net/15938/easy-and-smooth-hummus-recipe/"
            ),
            ReiseZieleModel(
                name: "Greece",
                hotelStars: 322,
                description: """
                **Bezeichnung**
                
                - 1 (15-ounce) can chickpeas or 1 ½ cups (250 grams) cooked chickpeas
                - 1/4 cup (60 ml) fresh lemon juice, 1 large lemon
                """,
                reiseImage: "greece",
                reiseURL: "https://www.inspiredtaste.net/15938/easy-and-smooth-hummus-recipe/"
            ),
            ReiseZieleModel(
                name: "Thailand",
                hotelStars: 166,
                description: """
                **Bezeichnung**
                
                - Über diese Unterkunft
                4 Schlafzimmer zu Hause, 4 Badezimmer, Kü
                """,
                reiseImage: "tailand",
                reiseURL: "https://www.inspiredtaste.net/15938/easy-and-smooth-hummus-recipe/"
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
                reiseImage: "spain",
                reiseURL: "https://www.inspiredtaste.net/15938/easy-and-smooth-hummus-recipe/"
            )
        ]
    }
}
