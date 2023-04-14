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
        ZStack { // puts views on top of each other to create a stack
            
            // displays the background image for the popular destination
            Image(imageName).opacity(0.75)
            VStack { // stacks views vertically
                
                VStack {
                    Text(name)
                        .font(.system(size: 38, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.all)

                }
                .frame(maxWidth: .infinity, maxHeight: 200) // sets the frame size of the content to fit the parent view

                
            }
            .background(Color.white) // sets the background color to white
            .frame(width: 150, height: 150) // sets the frame size of the parent view to 400x600
            .opacity(0) // sets the opacity of the parent view to 85%
            .cornerRadius(30) // sets the corner radius of the parent view to 5
            .shadow(radius: 15) // adds a shadow to the parent view

            
        }
       // .edgesIgnoringSafeArea(.all) // ignores safe areas to allow content to extend to edges of the screen
    }
}


struct DetailPopularDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPopularDestinationView(name: "Malediven",imageName: "Malediven")
    }
}
