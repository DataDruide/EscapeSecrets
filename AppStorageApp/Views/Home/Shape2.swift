//
//  Shape2.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 16.03.23.
//

import SwiftUI

struct Shape2: View {
    var body: some View {
        NavigationLink(destination: MultiBookingView()) {
            Image("createticket") // Bild aus Assets.xcassets
                .resizable()
                .frame(width: 40, height: 40)
                .position(x:20,y:300)
            VStack {
                Text("Custom Flights")
                    .foregroundColor(.black)
                    .position(x:-70,y:350)
                    .font(.system(size: 12))
                
            }
        }
    }
}

struct Shape2_Previews: PreviewProvider {
    static var previews: some View {
        Shape2()
    }
}
