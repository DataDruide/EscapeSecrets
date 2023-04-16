//
//  FavoriteTargets.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 13.04.23.
//
//
import Foundation
import SwiftUI


// Model für die Länder und Detailansicht

struct FavoriteTargets : Hashable, Identifiable{
    var id = UUID()
    
    let name : String
    let imageName : String
}
