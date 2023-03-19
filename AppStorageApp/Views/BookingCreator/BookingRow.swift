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
                    Text("Anzahl der aufgegebenen Gepäckstücke:")
                        .font(.headline)
                    
                    Stepper(value: $checkedBags, in: 0...10) {
                        Text("\(checkedBags) \(checkedBags == 1 ? "Gepäckstück" : "Gepäckstücke")")
                    }
                    .padding()
                    .foregroundColor(.white)
                }
                
                
                if selectedFlight != nil && selectedSeat != nil && checkedBags > 0 {
                    //  PaymentView
                } else {
                    Text("Bitte wählen Sie einen Sitzplatz und geben Sie die Anzahl der aufgegebenen Gepäckstücke an, um fortzufahren.")
                }
            }
            ImageSelectionView()
        }
        
    }
