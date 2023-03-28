//
//  TripTypeViewModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//
import Foundation
import MapKit


//MARK: MODEL VIEW

class TripTypeViewModel : ObservableObject {
    
    
    
    @Published var activities : [Activities] = []
    @Published var places : [Places] = []
    @Published var total : Int = 0
    @Published var searchText : String = ""
   
    func addActivities(newItem: Activities) {
       
        activities.append(newItem)
        total += newItem.price
    }
    
    func removeFromCart (newItem: Activities){
        
        activities = activities.filter{ $0.id != newItem.id}
        total -= newItem.price
    }
    
}
    

