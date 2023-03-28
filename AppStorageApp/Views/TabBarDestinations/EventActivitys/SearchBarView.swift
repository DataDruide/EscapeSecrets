//
//  SearchBarView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//
import SwiftUI

struct SearchBarView: View {
    
    // Bindet die searchText Eigenschaft aus einer anderen View ein
    @Binding var searchText : String
    
    var body: some View {
        HStack {
            // Symbol für Lupe
            Image(systemName: "magnifyingglass")
                // Legt die Farbe des Symbols fest
                .foregroundColor(
                    searchText.isEmpty ? Color("ButtoninfoBackgroundColor"): Color("DarkLight"))
            
            // Eingabefeld für den Suchtext
            TextField("Type something here...",text: $searchText)
                // Legt die Farbe des Textfeldes fest
                .foregroundColor(
                    searchText.isEmpty ? Color("RoundedBackgroundColor-1"): Color("DarkLight"))
                // Fügt ein Symbol hinzu, um den Text zu löschen
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        // Legt Abstand und Position des Symbols fest
                        .padding()
                        .offset(x:10)
                        // Legt die Sichtbarkeit des Symbols fest
                        .opacity(
                            searchText.isEmpty ? 0.0 : 1.0)
                        // Löscht den Text, wenn auf das Symbol getippt wird
                        .onTapGesture {
                            searchText = ""
                        }
                    ,alignment: .trailing
                
                )
            
        }
        // Legt den Abstand und die Schriftgröße des Views fest
        .padding()
        .font(.headline)
        // Legt die Hintergrundfarbe des Views fest
        .background(
        RoundedRectangle(cornerRadius: 25)
            .fill(Color("RoundedBackgroundColor-1"))
        )
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
