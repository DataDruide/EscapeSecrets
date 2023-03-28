//
//  OfferCard.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 02.03.23.
//
//
//import SwiftUI
//
//struct OfferCard: View {
//    
//    @State var offerProduct : String = ""
//    @State var offerPrice : String = ""
//    
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill(Color.black)
//                .frame(width: 390, height: 200) // reduzieren der Größe des Rechtecks
//                .cornerRadius(20)
//                .opacity(0.75)
//                .overlay(
//                    Rectangle()
//                        .stroke(Color.yellow, lineWidth: 3)
//                        .cornerRadius(20)
//                )
//            VStack() {
//                HStack{
//                    Image("descriptionOffer")
//                        
//                    Image("price")
//                }
//               
//                Button(action: {}) {
//                    Text("Book now")
//                        .foregroundColor(.white)
//                        .padding(.horizontal, 50)
//                        .padding(.vertical, 10)
//                        .background(Color.orange)
//                        .cornerRadius(10)
//                }
//                
//                
//            }
//            .padding(30)
//        }
//    }
//}
//
//struct OfferCard_Previews: PreviewProvider {
//    static var previews: some View {
//        OfferCard()
//    }
//}
