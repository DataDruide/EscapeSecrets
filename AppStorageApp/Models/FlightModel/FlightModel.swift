////
////  FlightModel.swift
////  AppStorageApp
////
////  Created by Marcel Zimmermann on 30.03.23.
////
import Foundation
import SwiftUI


struct Flights : Identifiable {
    
    var id = UUID()
    let name : String
    let image : String
    let description : String
    let price : Int
   
}

// Erstellen weiterer Instanzen der Flights-Struct und Speichern in Variablen

private var flight1 = Flights(name: "European Airlines", image: "European",description: "International Airline We fly with us 365 Days of the Year", price: 730)

private var flight2 = Flights(name: "Lufthansa Airlines", image: "Lufthansa",description: "Lufthansa A German Airlines Thank You when you fly with us",price: 1000)

private var flight3 = Flights(name: "Türkiye Airlines", image: "Türkiye",description: "Türkisch Airline a better Flight ",price: 730)

private var flight4 = Flights(name: "Deutsche BA", image: "DeutscheBA",description: "A Airline who since at 1978", price: 1430)




struct FlightModel {
    var flightsList : [Flights] = [flight1,flight2,flight3,flight4]
    var searchtext : String = ""
    
}
