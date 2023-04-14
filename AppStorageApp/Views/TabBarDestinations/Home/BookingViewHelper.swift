//
//  SearchBarView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 05.04.23.
//

import SwiftUI

struct BookingViewHelper: View {
    
    // Bindet die searchText Eigenschaft aus einer anderen View ein
    @Binding var searchText : String
    
    var body: some View {
        
        ZStack {
            // Ein Farbverlauf wird als Hintergrund festgelegt
            LinearGradient(colors: [.black.opacity(0.97),.black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            Image("flightsearchbg")
                .resizable()
                .ignoresSafeArea(.all)
                .opacity(0.33)
            // Searchbar mit Lupe
            
            VStack{
                
                Text("Search your Flight ")
                    .foregroundColor(.orange)
                    .font(.title)
                
                
            
                
                TextField("Text here...",text: $searchText)
                    .frame(maxWidth: 250, maxHeight: 45)
                    .background(Color.gray.opacity(0.7))
                    .foregroundColor(
                        searchText.isEmpty ? Color(.white): Color(.orange))
                    .shadow(color: .gray, radius: 0.5, x: 1.00, y: 1)
                    .blur(radius: 0.5)
                    .cornerRadius(15)
                
                
                // Legt den Abstand und die Schriftgröße des Views fest
                    .padding()
                    .font(.headline)
                
                
            }
           
        }
    }
}
struct BookingViewHelper_Previews: PreviewProvider {
    static var previews: some View {
        BookingViewHelper(searchText: .constant(""))
    }
}
