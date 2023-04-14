//
//  PopularRestaurantsView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 03.04.23.
//
import SwiftUI

struct PopularRestaurantsView: View {
    
    let restaurants : [Restaurant] = [
        .init(name: "Musical && Dance", imageName: "amerikanischstyle"),
        .init(name: "Bar66 ", imageName: "bar66"),
        .init(name: "GoldenNucket Grill", imageName: "goldenteacher"),
        .init(name: "Maryjay Cafe", imageName: "SanFrancisco")
        
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Popular Restaurants")
                .padding()
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
                .padding(.top)
            CardView {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 16) {
                        ForEach(restaurants, id: \.self) { restaurant in
                            NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                                RestaurantCardView(restaurant: restaurant)
                            }
                        }
                    }
                    .padding(.bottom)
                }
                .cornerRadius(15)
            }
        }
    }
    
    struct PopularRestaurantsView_Previews: PreviewProvider {
        static var previews: some View {
            PopularRestaurantsView()
        }
    }
    
}
   
    
