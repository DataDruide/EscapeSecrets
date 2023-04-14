import SwiftUI

struct Home: View {
    
    // Zustandsvariable zur Verwaltung der TripTypViewModel
    @EnvironmentObject var tripType: TripTypeViewModel
    @EnvironmentObject var hotelType: HotelTypeViewModel
    @EnvironmentObject var flightType: FlightTypeViewModel
    
    // Zustandsvariablen zum Anzeigen der verschiedenen Ansichten
    @State private var HotelListViewisShowing = false
    @State private var FlightListViewisShowing = false
    @State private var ActivityViewisShowing = false
    @State var showFloatingButton = false
    
    // Zustandsvariable zum Speichern des aktuellen Tabs
    @State private var selection = 0
    
    // Initialisierung der TabBar-Hintergrundfarbe
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
    }
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                // HomeRow zeigt Member-Informationen
                HomeRow()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home").fontWeight(.black)
                    }
                    .tag(0)
                
                // FlightListView zeigt eine Liste von Flügen an
                FlightListView(flightListViewIsShowing: $FlightListViewisShowing)
                    .environmentObject(flightType)
                    .tabItem {
                        Image(systemName: "airplane")
                        Text("FlightSearch").fontWeight(.black)
                    }
                    .tag(1)
                
                // HotelListView zeigt eine Liste von Hotels an
                HotelListView(HotelListViewisShowing: $HotelListViewisShowing)
                    .environmentObject(hotelType)
                    .tabItem{
                        Image(systemName: "bed.double").resizable()
                        Text("Hotel")
                    }
                    .tag(2)
                
                // PlanActivityTripView zeigt Aktivitäten, die geplant werden können
                ActivityTripView()
                    .environmentObject(tripType)
                    .tabItem {
                        Image(systemName: "figure.walk").resizable()
                        Text ("Activities")
                    }
                    .tag(3)
                
                // BookingCartView zeigt den Buchungswagen an
                BookingCartView()
                    .tabItem{
                        BookingCartButton(numberOfItems: 0)
                        Text("Cart")
                    }
                    .tag(4)
                    .badge(flightType.flights.count) // Anzahl der Flüge
                    .badge(tripType.activities.count) // Anzahl der Aktivitäten
                    .badge(hotelType.hotels.count) // Anzahl der Hotels
            }
        }
        
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(TripTypeViewModel())
            .environmentObject(HotelTypeViewModel())
            .environmentObject(FlightTypeViewModel())
    }
}
