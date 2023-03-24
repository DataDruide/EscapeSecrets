//
//  BookingModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 24.03.23.
//


import Foundation

struct BookingModel: Identifiable {
    let id = UUID()
    var name: String
    var bookingArt: String
    var bookingImage: String
}
