//
//  RestaurantDetailView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 12.04.23.
//

import SwiftUI

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack {
            Image(restaurant.imageName)
                .resizable()
                .padding()
                .scaledToFit()
                .frame(width: 400 , height:  300)
                .cornerRadius(15)
            
            Text(restaurant.name)
                .font(.system(size: 20, weight: .semibold))
                .padding()
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.orange)
                Image(systemName: "star.fill")
                    .foregroundColor(.orange)
                Image(systemName: "star.fill")
                    .foregroundColor(.orange)
                Image(systemName: "star.fill")
                    .foregroundColor(.orange)
                Image(systemName: "star")
                    .foregroundColor(.gray)
                
                Text("4.9 - Bacon - $$")
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
                
                Spacer()
            }
            .font(.system(size: 14))
            .padding()
            
            Spacer()
        }
        .navigationBarTitle(restaurant.name)
    }
}



struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant(name: "Route66", imageName: "goldenteacher"))
    }
}
