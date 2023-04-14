//
//  BodyInhaltView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 08.04.23.
//

import SwiftUI

struct BodyInhaltView: View {
    var body: some View {
        Form{
            VStack(alignment: .leading) {
                HomeRow()
            }
            VStack {
                
                PopularRestaurantsView()
            }
        }.background(Color.gray)
    }
}

struct BodyInhaltView_Previews: PreviewProvider {
    static var previews: some View {
        BodyInhaltView()
    }
}
