//
//  ReiseZieleModel.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//

import Foundation

struct ReiseAuswahlModel: Identifiable {
    let id = UUID()
    var name: String
    var reise: String
    var reiseImage: String
    var reiseURL: String
}
