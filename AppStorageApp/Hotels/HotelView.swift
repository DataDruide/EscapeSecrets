//
//  HotelView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct HotelView: View {
    var body: some View {
        ZStack {
            Image("eisberge")
                .opacity(0.3)

            Image("canyon")
                .opacity(0.6)
            VStack(spacing: 25) {
                HStack{
                    
                    Image(systemName: "arrow.uturn.backward.square.fill")
                    Text("ProductCard")
                    Image(systemName: "heart")
                }
                .padding(.top)
                OfferCard()
                    .padding(.bottom)

            }
        }
    }
        struct HotelView_Previews: PreviewProvider {
            static var previews: some View {
                HotelView()
            }
        }
    }

