//
//  OnboardItem.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 14.04.23.
//

import SwiftUI

struct OnboardItem: View {
    
    var image: String = ""
    var title: String = ""
    var description: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            
            Image(image)
                .resizable()
                .padding(20)
                .scaledToFit()
                .cornerRadius(30)
            
            Spacer()
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .kerning(0.8)// Anp. des horizontalen Abst. zw. Buchstaben in einem Text
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
            
            
            Text(description)
                .font(.callout)
                .foregroundColor(.gray)
                .padding(.vertical, 5)
                .padding(.leading, 20)
            
            Spacer()
        }
    }
}


struct OnboardItem_Previews: PreviewProvider {
    static var previews: some View {
        OnboardItem()
    }
}
