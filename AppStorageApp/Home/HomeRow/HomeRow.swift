//
//  HomeRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//

import SwiftUI



struct HomeRow: View {
    
    @StateObject var reiseViewModel: ReiseZieleViewModel = ReiseZieleViewModel()
    var body: some View {
        ZStack {
            
            Color.yellow.opacity(0.6)
            VStack {
                
                
                
                Text("Reiseangebote")
                
                
                List {
                    Image("singapur")
                        .padding()
                    Image("mala")
                        .padding()
                    Image("singapur")
                        .padding()
                    Image("singapur")
                        .padding()
                    
                }
            }
        }
    }
}
