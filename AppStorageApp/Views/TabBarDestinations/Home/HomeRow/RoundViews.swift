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
        // Definiere ein Bild mit dem angegebenen Systemnamen und den folgenden Eigenschaften
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtoninfoTextColor"))
            .frame(width: 100.0, height: 56.0)
            // Lege einen Kreis über das Bild mit der folgenden Hintergrundfarbe
            .background(
                Circle()
                    .fill(Color.purple))
                .transition(.scale)
            
    }
}

struct RoundCloseViews: View {
    var systemName : String
    
    var body: some View {
        // Definiere ein Bild mit dem angegebenen Systemnamen und den folgenden Eigenschaften
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonCloseTextColor"))
            .frame(width: 100.0, height: 56.0)
            // Lege einen Kreis über das Bild mit der folgenden Hintergrundfarbe
            .background(
                Circle()
                .fill(Color("ButtonCloseBackgroundColor"))
                .transition(.scale)
            )
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
            RoundViews(systemName: "info")
                .preferredColorScheme(.dark)
            // Zeige eine runde Ansicht mit dem Systemnamen "xmark" im Dark Mode
            RoundCloseViews(systemName: "xmark")
        }
    }
}
