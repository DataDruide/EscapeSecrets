//
//  FavoriteTargets.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 13.04.23.
//

import Foundation
import SwiftUI

struct FavoriteTargets : Hashable, Identifiable {
    var id = UUID()
    let name : String
    let imageName : String
}
