//
//  FlightListView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 30.03.23.
//



import SwiftUI

struct FlightListView: View {
    @StateObject var flightType = FlightTypeViewModel()
    @Binding var flightListViewIsShowing: Bool
  //  @State private var searchText = ""
    @State var text: String = ""
    var body: some View {
        ZStack {
            // Ein Farbverlauf wird als Hintergrund festgelegt
            LinearGradient(colors: [.black.opacity(0.97),.black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            Image("flightsearchbg")
                .resizable()
                .ignoresSafeArea(.all)
                .opacity(0.33)

            VStack {
                SearchBarHomeRow(text: $text)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 30)

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 10) {
                        ForEach(flightType.flightList.filter({ text.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(text) })) { flight in
                            NavigationLink(destination: FlightDetailView(flight: flight).environmentObject(Cart1())) {
                                FlightButton(name: flight.name, image: flight.image)
                                    .frame(height: 80)
                                    .foregroundColor(.white)
                                    .cornerRadius(6)
                                   
                            }

                        }

                    }
                    .padding(.horizontal, 20)
                    .background(Color.gray)
                }
                .navigationBarTitleDisplayMode(.inline)
                .cornerRadius(30)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)

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

