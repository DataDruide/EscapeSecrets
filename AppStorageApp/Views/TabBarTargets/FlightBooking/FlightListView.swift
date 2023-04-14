//
//  FlightListView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 30.03.23.
//

import SwiftUI


import SwiftUI

struct FlightListView: View {
    @StateObject var flightType = FlightTypeViewModel()
    @Binding var flightListViewIsShowing: Bool
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
          
            
            LinearGradient(colors: [.black.opacity(0.90), .black.opacity(0.80)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)

            VStack {
                SearchBarView1(searchTerm:  $searchText)
                    .padding(.horizontal)
                
                ScrollView(showsIndicators: false) {
                    VStack() {
                        ForEach(flightType.flightList.filter({ searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText) })) { flight in
                            NavigationLink(destination: FlightDetailView(flight: flight).environmentObject(Cart1())) {
                                FlightButton(name: flight.name, image: flight.image)
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(5)
                            }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .cornerRadius(30)
                .multilineTextAlignment(.center)
            }
            .cornerRadius(30)
        }
    }
}


struct FlightListView_Previews: PreviewProvider {
    static var previews: some View {
        FlightListView(flightListViewIsShowing: .constant(true))
    }
}

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

