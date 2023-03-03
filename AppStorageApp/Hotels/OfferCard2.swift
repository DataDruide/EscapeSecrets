//
//  OfferCard2.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 03.03.23.
//

import SwiftUI

struct OfferCard2: View {
    
    @State var offerProduct : String = ""
    @State var offerPrice : String = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .frame(width: 390, height: 200) // reduzieren der Größe des Rechtecks
                .cornerRadius(20)
                .opacity(0.6)
                .overlay(
                    Rectangle()
                        .stroke(Color.black, lineWidth: 3)
                        .cornerRadius(20)
                )
            VStack() {
                HStack{
                    Image("offercard2img")
                        
                    Image("offercardpriceimg")
                }
               
                Button(action: {}) {
                    Text("Book now")
                        .foregroundColor(.orange)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 10)
                        .background(Color.purple)
                        .cornerRadius(10)
                }
                
                Button(action: {}) {
                    Text("Cancel")
                        .foregroundColor(.indigo)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 10)
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
            .padding(30)
        }
    }
}

struct OfferCard2_Previews: PreviewProvider {
    static var previews: some View {
        OfferCard2()
    }
}
