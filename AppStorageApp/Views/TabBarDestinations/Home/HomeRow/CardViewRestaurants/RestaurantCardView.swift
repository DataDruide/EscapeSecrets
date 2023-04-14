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

            
            VStack(alignment: .leading, spacing: 4) {
                Text(restaurant.name)
                    .shadow(radius: 5)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(.top, 4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(LinearGradient(gradient: Gradient(colors: [.white.opacity(0.4), .white.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star")
                }
                .foregroundColor(.orange)
                .font(.system(size: 14))
                .padding(.horizontal)
                
                Text("4.7 - Sushi - $$")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.bottom, 4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray.opacity(0.8)) // Hintergrund für den Text hinzufügen
            }
            .padding(.vertical, 8)
           // .padding(.horizontal, 8)

            .background(Color(.init(white: 0.95, alpha: CGFloat())))
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
