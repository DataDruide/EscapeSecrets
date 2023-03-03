//
//  HotelView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//
import SwiftUI

struct HotelView: View {
    var body: some View {
        ScrollView{
            ZStack {
                Image("canyon")
                    .opacity(0.6)
                    .ignoresSafeArea()
                  Image("")
                VStack(spacing: 25) {
                    HStack{
                        Image(systemName: "arrow.uturn.backward.square.fill")
                        Text("ProductCard")
                        Image(systemName: "heart")
                    }
                    .padding(.top)
                    
                    OfferCard()
                        .padding(.bottom)
                    OfferCard2()
                        .padding(.bottom)
                        
                    
                }
            }
        }
    }
}
struct HotelView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView()
    }
}
