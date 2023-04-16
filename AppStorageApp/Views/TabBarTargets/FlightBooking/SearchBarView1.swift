//
//  SearchBarView1.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 15.04.23.
//

import SwiftUI

// SearchBar für die Flugsuche

struct SearchBarView1: View {
    @Binding var searchTerm: String
    
    var body: some View {
        HStack {
            
            
            Button(action: {
                self.searchTerm = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.black)

            }
            
            
            TextField("Search", text: $searchTerm)
                .padding(.vertical, 10)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            
        }

    }
}

