//
//  ShowHomeView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//

import SwiftUI

struct CountryDetailView: View {
    var imageName: String
    var hotelName: String
    var stars: String
    var price: Int
    
    var body: some View {
        ZStack() {
            Image(imageName)
                .resizable()
                .frame(height: 300)
                .cornerRadius(8)
                .shadow(radius: 4)
           
           
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(hotelName)
                        .font(.headline)
                        .foregroundColor(.yellow)
                    
                    Text("$\(price) per night")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
               
            }
        }
    }
}
import SwiftUI
import MapKit

struct MapRow: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 41.902782, longitude: 12.496365)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

