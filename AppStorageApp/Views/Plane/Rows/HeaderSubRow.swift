//
//  HeaderSubRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 24.03.23.
//

import SwiftUI

struct HeaderSubRow: View {
    
    @Binding var isRoundTrip: Bool
    @State var selectedTravelStory: String = "OneWay"

    var body: some View {
        
          
            VStack {
                HStack {
                    Text("TravelStory")
                        .font(.headline)
                    Button(action: {
                        selectedTravelStory = "OneWay"
                        isRoundTrip = false // Setzen Sie isRoundTrip auf false, wenn OneWay ausgewählt ist
                    }, label: {
                        Text("OneWay")
                            .foregroundColor(selectedTravelStory == "OneWay" ? .white : .black)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(selectedTravelStory == "OneWay" ? Color.purple : Color.purple)
                            .cornerRadius(8)
                    })
                    
                    Button(action: {
                        selectedTravelStory = "RoundTrip"
                        isRoundTrip = true // Setzen Sie isRoundTrip auf true, wenn RoundTrip ausgewählt ist
                    }, label: {
                        Text("RoundTrip")
                            .foregroundColor(selectedTravelStory == "RoundTrip" ? .white : .black)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(selectedTravelStory == "RoundTrip" ? Color.purple : Color.purple)
                            .cornerRadius(8)
                    })
                    
                    
                }
                .padding()
              
            }
        }
    }
