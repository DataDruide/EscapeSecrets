//
//  ReiseZieleModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//

import Foundation

struct ReiseZieleModel: Identifiable {
    let id = UUID()
    let name: String
    let hotelStars: Int
    let description: String
    let reiseImage: String
    let reiseURL: String
}
