//
//  Home.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI



struct Home: View {
    // TripTypeViewModel ist zuständig
    @EnvironmentObject var tripType : TripTypeViewModel
    @EnvironmentObject var hotelType : HotelTypeViewModel

    // State variable zum switchen der Views
    @State private var HotelListViewisShowing = false
    
    // State variable wo den akuellen Tab wiedergibt
    @State private var selection = 0
    
    init() {
           hotelSetup()
//        addHotels(newItem: Hotels(name: "hotel1", description: "gzghjgfhg", image: "hotel1", price: 299))
       }
    
    var body: some View {
        VStack{
            
            TabView(selection:$selection){
                // HomeView zeigt MemberInformationen
                HomeRow()
                    .environmentObject(AuthService())
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                            .fontWeight(.black)
                    }
                    .tag(0)
                JobRow(viewModel: JobListViewModel())
                    .tabItem {
                        Image(systemName: "graduationcap.circle")
                        Text("Job")
                            .fontWeight(.black)
                    }
                    .tag(1)
                // HotelListView zeigt eine liste an Hotels
                HotelListView(HotelListViewisShowing: $HotelListViewisShowing)
                    .environmentObject(hotelType)
                    .tabItem{
                        Image(systemName: "bed.double")
                            .resizable()
                        Text("Hotel")
                    }
                    .tag(2)
                // PlanActivityTripView zeigt  Activitäten die du planen kannst
                PlanActivityTripView()
                    .environmentObject(tripType)
                    .tabItem {
                        Image(systemName:"figure.walk")
                            .resizable()
                        Text ("Activities")
                    }
                    .tag(3)
                BookingCartView()
                    .tabItem{
                        BookingCartButton(numberOfItems: 0)
                        Text ("Cart")
                    }// The badge zeigt die Nummer der gewählten Activitys
                    .tag(4)
                    .badge(tripType.activities.count)
                    .badge(hotelType.hotels.count)
                        
                    }
            }
            .accentColor(.blue) // The accent Farbe wird auf blau gesetzt
        }
    }


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(AuthService())
            .environmentObject(TripTypeViewModel())
            .environmentObject(HotelTypeViewModel())// The environment object setzt eine neue Instanz TripType
    }
}
