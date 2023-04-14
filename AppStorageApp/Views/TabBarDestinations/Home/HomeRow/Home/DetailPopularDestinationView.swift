//
//  DetailPopularDestinationView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 11.04.23.
//

import SwiftUI
struct DetailPopularDestinationView: View {
    let name: String // stores the name of the popular destination
    let imageName: String // stores the name of the image file for the popular destination

    var body: some View {
        GeometryReader { geometry in // get the size of the parent view
            ZStack {
                Image(imageName)
                    .resizable() // make the image resizable
                    .aspectRatio(contentMode: .fit) // fill the image to the edges
                    .frame(width: geometry.size.width, height: geometry.size.height) // set the size of the image to the parent view size
                    .opacity(0.75)
                VStack {
                    VStack {
                        Text(name)
                            .font(.system(size: 38, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.all)
                    }
                }
                .background(Color.black)
                .opacity(0.85)
                .cornerRadius(30)
                .shadow(radius: 15)
                // ViewModel mit Daten anlegen
               
//                
//                VStack(alignment: .center, spacing: 10) {
//                    Text("Companies that have already settled and also have branches here")
//                        .font(.system(size: 24, weight: .semibold))
//                        .foregroundColor(.white)
//                }
                
            }
            .edgesIgnoringSafeArea(.all)
            
            
        }
        .background(Color.black)
        
       

    }
}

struct DetailPopularDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPopularDestinationView(name: "Malediven",imageName: "Malediven")
    }
}
