//
//  RoundViews.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//

import SwiftUI

struct RoundViews: View {
    var systemName : String
    
    var body: some View {
        
        VStack(alignment:.trailing) {
           
                
                // Definiere ein Bild mit dem angegebenen Systemnamen und den folgenden Eigenschaften
                Image(systemName: systemName)
                .font(.title)
                    .foregroundColor(Color(.black))
                    .frame(width: 40.0, height: 40.0)
                // Lege einen Kreis über das Bild mit der folgenden Hintergrundfarbe

                    .background(
                        
                        Circle()
                            .fill(Color.gray.opacity(0.65))
                            .shadow(color: .black.opacity(0.8), radius: 5, x: 1, y: 2)
                            .shadow(color: .gray.opacity(0.8), radius: 5, x: 3, y: 5)

                    )
            
                    .transition(.scale)
                    .blur(radius: 0.5)
               
            
        }
       // .shadow(color: .black, radius: 1, x: 0, y: 5)

    }
}
struct RoundCloseViews: View {
    var systemName : String
    
    var body: some View {
        // Definiere ein Bild mit dem angegebenen Systemnamen und den folgenden Eigenschaften
        
        VStack {
            
            Image(systemName: systemName)
                .font(.title)
                .foregroundColor(Color(.black))
                .frame(width: 100.0, height: 56.0)
            // Lege einen Kreis über das Bild mit der folgenden Hintergrundfarbe
                .background(
                    
                    Circle()
                        .fill(Color.gray.opacity(0.65))
                        .shadow(color: .black.opacity(0.8), radius: 5, x: 1, y: 2)
                        .shadow(color: .gray.opacity(0.8), radius: 5, x: 3, y: 5)

                )

        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            // Zeige eine runde Ansicht mit dem Systemnamen "info"
            RoundViews(systemName: "info")
            // Zeige eine runde Ansicht mit dem Systemnamen "xmark"
            RoundCloseViews(systemName: "xmark")
        }
        VStack{
            // Zeige eine runde Ansicht mit dem Systemnamen "info" im Dark Mode
            RoundViews(systemName: "person.crop.circle")
                .preferredColorScheme(.dark)
            // Zeige eine runde Ansicht mit dem Systemnamen "xmark" im Dark Mode
            RoundCloseViews(systemName: "xmark")
        }
    }
}
