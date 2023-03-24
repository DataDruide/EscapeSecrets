//
//  BookingRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 19.03.23.
//
import SwiftUI

struct BookingRow: View {
    
    @State var selectedFlight: Flight?
    @State var selectedSeat: Seat?
    @State var checkedBags: Int = 0
    
    var body: some View {
        VStack {
            Text("Step Two")
                .foregroundColor(.black)
            
            Text("Here you can enter\nyour luggage and choose your seat")
                .foregroundColor(.black)
                .multilineTextAlignment(.center)

           
            VStack {
                Text("Number of Bags:")
                    .font(.headline)
                    .foregroundColor(.black)

                
                Stepper(value: $checkedBags, in: 0...10) {
                    Text("\(checkedBags) \(checkedBags == 1 ? "Bag" : "Bags")")
                        .foregroundColor(.black)

                }
                .padding()
                .foregroundColor(.black)
            }
            
            
            if selectedFlight != nil && selectedSeat != nil && checkedBags > 0 {
                // PaymentView
            } else {
                Text("Please watch for a Seat and bording them")
                    .foregroundColor(.black)

            }
            
            ImageSelectionView()
            
            Button(action: {
                // Logic to save the data
            }) {
                Text("Save Booking Data")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.purple)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }
}
