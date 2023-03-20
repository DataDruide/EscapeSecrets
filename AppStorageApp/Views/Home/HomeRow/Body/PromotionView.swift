//
//  PromotionView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 20.03.23.
//

import SwiftUI


struct PromotionView: View {
    @State private var showDetail = false
    @State private var showDetail1 = false
    @State private var showDetail2 = false
    @State private var showDetail3 = false
    @State var Destination : String = ""
    
    @StateObject var bookingViewModel = BookingViewModel()
    
    var body: some View {
           NavigationView {
               VStack {
                   Text("Topseller")
                       .font(.system(size: 22, weight: .bold))
                       .foregroundColor(.purple)

                   HStack {
                       NavigationLink(destination: DetailView()) {
                           PromotionItemView(image: "bali", header: "Executive", title: "Bali", subtitle: "Indonesia")
                       }

                       NavigationLink(destination: DetailView1()) {
                           PromotionItemView(image: "fuji", header: "Business", title: "Mount Fuji", subtitle: "Japan")
                       }
                   }
                   HStack {

                       NavigationLink(destination: DetailView2()) {
                           PromotionItemView(image: "canada", header: "Luxury", title: "Nature pure", subtitle: "Ottawa")
                       }

                       NavigationLink(destination: DetailView3()) {
                           PromotionItemView(image: "burjKahlifa 1", header: "Premium", title: "Vereinigten Arabischen Emirate", subtitle: "Dubai, Dhabi")
                       }
                   }
               }
           }
       }
   }

struct PromotionView_Previews: PreviewProvider {
    static var previews: some View {
        PromotionView()
    }
}
struct PromotionItemView: View {
    let image: String
    let header: String
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(10)

            Text(header)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
                .padding(.top, 10)

            Text(title)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.black)

            Text(subtitle)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.gray)
                .padding(.top, 5)

        }
        .padding()
        .background(Image("BG1"))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
