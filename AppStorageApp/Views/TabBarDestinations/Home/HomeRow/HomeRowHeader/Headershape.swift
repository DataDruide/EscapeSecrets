//
//  Headershape.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 08.04.23.
//

import SwiftUI


// HeaderShape Header von der HomeRow wo links ein Button ist
// in der Mitte als Überschrift ein Bild
// rechts ein FloatingActionButton wo ein Menü von nächsten Actionen auslösen

struct Headershape : View {
    
    @State private var JobViewIsShowing = false
    @State private var showBookingViewHelper = false
    @State private var searchText = ""
    @State private var showStewardessView = false

    var systemName : String
    @EnvironmentObject var authService: AuthService

    var body: some View {
        
        
        NavigationStack {
           
            VStack {
                HStack {
                    Shape1(username: "authService")
                    Spacer()
                    
                   
                    
                    ZStack(alignment: .topTrailing) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        FloatingActionButton()
                    }
                }
            }
        }
    }
}



struct Headershape_Previews: PreviewProvider {
    static var previews: some View {
        Headershape(systemName: "figure.walk.arrival")
    }
}
