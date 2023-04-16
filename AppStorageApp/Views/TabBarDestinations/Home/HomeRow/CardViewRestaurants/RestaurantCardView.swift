//
//  RestaurantCardView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 12.04.23.
//

import SwiftUI


struct RestaurantCardView: View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(restaurant.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame( width: 400)
                .cornerRadius(5)
                .shadow(radius: 5)

            
            
        }
    }
}

struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(restaurant: Restaurant(name: "Route66", imageName: "goldenteacher"))
    }
}

