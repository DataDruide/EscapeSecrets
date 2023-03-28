//
//  BookingViewModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 20.03.23.
//

//
//import SwiftUI
//
//class BookingViewModel: ObservableObject {
//    @Published var checkInDate: Date = Date()
//    @Published var checkOutDate: Date = Date().addingTimeInterval(86400) // Set checkout date to be 1 day after checkin
//    @Published var selectedRooms: Int = 1
//    @Published var totalAmount: Double = 0
//    
//    
//    let pricePerNight: Double = 125
//    
//    func calculateTotalAmount() {
//        let days = Calendar.current.dateComponents([.day], from: checkInDate, to: checkOutDate).day ?? 1
//        totalAmount = Double(selectedRooms) * Double(days) * pricePerNight
//    }
//}
//
//
