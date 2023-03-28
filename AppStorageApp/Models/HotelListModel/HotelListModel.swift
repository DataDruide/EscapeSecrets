//
//  HotelListModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//


import Foundation
import SwiftUI

//MARK: MODEL

struct Hotels : Identifiable {
   
    var id = UUID()
    var name : String
    var description: String
    var image : String
    var price : Int
}


var hotel1 = Hotels(name: "Nice", description: "The Hotel Negresco is an hotel located on the promenade. The Hotelname created by Henri Negresco, its frontopened on the opposite side of Mediterranean Sea", image: "hotel6",price: 799)


var hotel2 = Hotels(name: "Las Vegas", description: "This chic casino hotel is 4 miles from McCarran international Airport and very Interesting City", image: "hotel5",price: 699)


var hotel3 = Hotels(name: "Tokyo", description: "Minimalist Hotel ", image: "hotel4",price: 877)


var hotel4 = Hotels(name: "Sydney", description: "Wonderful Hotel", image: "hotel3",price: 430)


var hotel5 = Hotels(name: "Kenya", description: "Piece of paradise Hotel ", image: "hotel2",price: 555)


var hotel6 = Hotels(name: "Bali", description: "Surrended by nature", image: "hotel1",price: 876)


var hotelList : [Hotels] = [hotel1,hotel2,hotel3,hotel4,hotel5,hotel6]


func addHotels (newItem: Hotels ) {
   
    hotelList.append(newItem)

}

func hotelSetup () {
    
    addHotels(newItem: hotel1)
    addHotels(newItem: hotel2)
    addHotels(newItem: hotel3)
    addHotels(newItem: hotel4)
    addHotels(newItem: hotel5)
    addHotels(newItem: hotel6)
   
    
}





