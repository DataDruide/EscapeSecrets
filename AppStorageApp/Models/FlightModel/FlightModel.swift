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

private var flight1 = Flights(name: "Ethiopian Airlines", image: "Ethiopian Airlines",description: "International Airline We fly with us 365 Days of the Year", price: 1140)

private var flight2 = Flights(name: "Lufthansa Airlines", image: "Lufthansa",description: "Lufthansa A German Airlines Thank You when you fly with us",price: 599)

private var flight3 = Flights(name: "Turkish Airlines", image: "Turkish Airlines",description: "Türkisch Airline a better Flight ",price: 399)

private var flight4 = Flights(name: "ATA Airlines", image: "ATA Airlines",description: "A Airline who since at 1978", price: 699)
private var flight5 = Flights(name: "Condor Airlines", image: "Condor Airlines",description: "A Airline who since at 1978", price: 999)
private var flight6 = Flights(name: "TUI Airlines", image: "TUI Airlines",description: "A Airline who since at 1978", price: 999)
private var flight7 = Flights(name: "HERCULES AIRLINES", image: "HERCULES AIRLINES",description: "A Airline who since at 1978", price: 777)
private var flight8 = Flights(name: "WANDA AIRLINES", image: "WANDA AIRLINES",description: "A Airline who since at 1978", price: 444)



struct FlightModel {
    var flightsList : [Flights] = [flight1,flight2,flight3,flight4,flight5,flight6,flight7,flight8]
    var searchtext : String = ""
    
}
