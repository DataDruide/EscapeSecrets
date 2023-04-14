//
//  Model.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//


import Foundation

struct Model : Identifiable {
    var id = UUID().uuidString
    var title : String
    var country : String
    var ratings : String
    var price : String
    var img : String
}
