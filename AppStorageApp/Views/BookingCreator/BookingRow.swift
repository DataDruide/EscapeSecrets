//
//  BookingRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 19.03.23.
//

import Foundation
import SwiftUI

struct BookingRow: View {
    
    @State var selectedFlight: Flight?
    @State var selectedSeat: Seat?
    @State var checkedBags: Int = 0
    
    var body: some View {
        VStack {
            Text("Step One of your Booking Process")
            Spacer()
           
                VStack {
                    Text("Number of Bags:")
                        .font(.headline)
                    
                    Stepper(value: $checkedBags, in: 0...10) {
                        Text("\(checkedBags) \(checkedBags == 1 ? "Bag" : "Bags")")
                    }
                    .padding()
                    .foregroundColor(.white)
                }
                
                
                if selectedFlight != nil && selectedSeat != nil && checkedBags > 0 {
                    //  PaymentView
                } else {
                    Text("Please watch for a Seat and bording them")
                }
            }
            ImageSelectionView()
        }
        
    }