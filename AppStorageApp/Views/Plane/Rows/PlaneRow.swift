

import SwiftUI

struct PlaneRow: View {
    @ObservedObject var viewModel = FlightSearchViewModel()
    @State private var isShowingFlightResults = false
    
    var body: some View {
        VStack {
            FooterRow()
            Button("Search Flights") {
                viewModel.fetchFlightDestinations {
                    isShowingFlightResults = true
                }
            }
            .padding()
            .sheet(isPresented: $isShowingFlightResults) {
                //FlightDestinationsView(flightDestinations: [FlightDestination], selectedDestination: Binding<FlightDestination?>)
            }
            Spacer()
        }
    }
}
