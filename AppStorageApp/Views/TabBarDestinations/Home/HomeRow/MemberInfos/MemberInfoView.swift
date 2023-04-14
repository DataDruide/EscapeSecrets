//
//  MemberInfoView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 29.03.23.
//

import SwiftUI

struct MemberInfoView: View {
    

    // Eigenschaften für den View
    let text : String
    let systemName : String
    
    var body: some View {
            
        // RoundedRectangle mit den Eigenschaften füllen und Größe festlegen
        RoundedRectangle(cornerRadius: Constants.General.roundedRectangleCornerRadius)
            .fill(Color(.black).opacity(0.1))
            .frame(width: Constants.General.roundedRectangleWidth, height: Constants.General.roundedRectangleHeight)
        
            // Text-Attribut für den Text-Stil definieren
            .font(.title)
            // HStack für das Icon und den Text einrichten
            .overlay(HStack{
                Image(systemName: systemName)
                    .foregroundColor(Color(.orange))
                Text(text)
                    .foregroundColor(Color(.orange))

            })
        
    }
}

// Preview für den MemberInfoView definieren
struct MemberInfoView_Previews: PreviewProvider {
    static var previews: some View {
        // Preview für den MemberInfoView mit Text und Icon
        MemberInfoView(text: "Hi", systemName: "list.bullet.indent")
        // Preview für den MemberInfoView mit Text und Icon
        MemberInfoView(text: "Hi", systemName: "list.bullet.indent")
            // Preview in Querformat darstellen
            .previewInterfaceOrientation(.landscapeRight)
    }
}

