//
//  BookingCategory.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 05.04.23.
//

import Foundation

struct BookingCategory: Hashable,Identifiable {
    var id = UUID()
    let name: String
    let country: String
    let imageName: String
}
