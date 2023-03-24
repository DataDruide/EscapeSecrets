

import SwiftUI

struct PlaneRow: View {
    @State var startAirport = ""
    @State var destinationAirport = ""
    @State var startToTravel = Date()
    @State var isRoundTrip = false
    
    var body: some View {
        ZStack {
            Image("BG 1")
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack {
                MenuButtonRow()
                    HeaderLetter(arrived: $destinationAirport, origin: $startAirport, startTravel: $startToTravel, isRoundTrip: $isRoundTrip)

              //  FooterRow(startAirport: $startAirport, destinationAirport: $destinationAirport, startToTravel: $startToTravel, isRoundTrip: $isRoundTrip)
                
                NavigationStack {
                    
                    NavigationLink(destination: TicketView()) {
                        Image("Flugticket")
                            .resizable()

                        
                    }
                    
                    NavigationLink(destination: FooterRow(startAirport: $startAirport, destinationAirport: $destinationAirport, startToTravel: $startToTravel, isRoundTrip: $isRoundTrip)) {
                        Image("Flugticket")
                            .resizable()

                        
                    }
                    
                    
                }
                
            }
        }
    }
}
