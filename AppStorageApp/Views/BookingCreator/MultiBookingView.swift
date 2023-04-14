

import SwiftUI

struct MultiBookingView: View {
    // @ObservedObject var viewModel = FlightSearchViewModel()
    
    @State private var from: String = ""
    @State private var to: String = ""
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var passengers: Int = 1
    @State private var isOneWay: Bool = true
    
    var body: some View {
        
        
        VStack(spacing: 50) {
            NavigationStack {
                FooterRow()
             
            }
        }
        
    }
        
        
        struct SeatDetailView: View {
            var seat: Seat
            
            var body: some View {
                VStack {
                    Text("Sitzplatz:")
                        .font(.headline)
                        .padding()
                    
                    Text(seat.seatNumber)
                        .font(.title)
                    
                }
            }
        }
   
        
         var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            return formatter
        }
    }




