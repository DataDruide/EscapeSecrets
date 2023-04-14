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
    let name : String
    let title: String
    let image : String
    let description : String
    let price : Int
   
    
}


private var hotel1 = Hotels(name: "Nizza",title: "Hotel Aqualaris Deluxe", image: "Nice", description: "The Hotel Aqualaris Deluxe is an hotel located on the promenade des anglais. it was named by Henri Negresco, its frontopened on the opposite side of Mediterranean Sea and is wonderfull for Kids and Parents",price: 250)
private var hotel2 = Hotels(name: "LasVegas",title: "Hotel RoyalEduard", image: "LasVegas", description: "This chic casino hotel is 4 miles from McCarran international Airport, 1 mile from the Las Vegas Convention Center and 3 miles from the Fremont Street Experience Shopping",price: 345)
private var hotel3 = Hotels(name: "Tokyo",title:"", image: "Tokyo", description: "Minimalist Hotel ",price: 495)
private var hotel4 = Hotels(name: "Sydney",title:"Hotel Austrian Outback Comfort", image: "Sydney", description: "Wonderful Hotel",price: 555)
private var hotel5 = Hotels(name: "Kenya",title:"Hotel Real Africa", image: "Kenya", description: "Piece of paradise Hotel ",price: 245)
private var hotel6 = Hotels(name: "Bali",title:"Hotel Paradiso", image: "Bali", description: "Surrended by nature\n Bali is a very nice Location who you can Relaxing of the Work Days, or with your Family can very anything Things in and out of Hotel Complex ",price: 269)

struct HotelModel {
    
    var hotelsList : [Hotels] = [hotel1,hotel2,hotel3,hotel4,hotel5,hotel6]
    
}

//var hotelList : [Hotels] = [hotel1,hotel2,hotel3,hotel4,hotel5,hotel6]


//func addHotels (newItem: Hotels ) {
//
//    hotelsList.append(newItem)
//
//}
//
//func hotelSetup () {
//
//    addHotels(newItem: hotel1)
//    addHotels(newItem: hotel2)
//    addHotels(newItem: hotel3)
//    addHotels(newItem: hotel4)
//    addHotels(newItem: hotel5)
//    addHotels(newItem: hotel6)
//
//
//}

//func displayItemList ( hotelList: [Hotels]) {
//    
//    var withOutOptionls = [Hotels]()
//    
//    for hotel in hotelList {
//        if hotel.suitRoom != nil {
//            withOutOptionls.append(hotel)
//        } else {
//        continue
//        }
//    }
//    print(withOutOptionls)
//}
//
