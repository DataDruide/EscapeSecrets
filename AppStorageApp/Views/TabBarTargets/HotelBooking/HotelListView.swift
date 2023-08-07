import SwiftUI

// Diese Ansicht repräsentiert die Liste der Hotels mit Suchfunktion und Hotelbuttons.
struct HotelListView: View {
    // Zustand von HotelType wird benötigt, um den Zustand der Hotels zu verwalten
    @StateObject var hotelType = HotelTypeViewModel()
    
    // Bindung an eine Variable, um den Zustand der HotelListView zu verwalten
    @Binding var HotelListViewisShowing: Bool
    
    // Suchtext für die Filterung der Hotels
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Hintergrundbild
                Image("santorini")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea(.all)
                
                // Ein Farbverlauf wird als Hintergrund festgelegt
                LinearGradient(colors: [.black.opacity(0.67), .black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Suchleiste
                    SearchBarView2(searchTerm: $searchText)
                        .padding(.horizontal)
                        .padding()
                        .background(Color.black.opacity(0.75))
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 10) {
                            // Liste der Hotels, die nach Suchtext gefiltert werden
                            ForEach(hotelType.hotelsList.filter({ searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText) })) { hotel in
                                NavigationLink(destination: HotelDetailView(hotel: hotel).environmentObject(Cart1())) {
                                    HStack {
                                        // Hotelbutton für jedes Hotel in der Liste
                                        HotelButton(name: hotel.name, image: hotel.image, description: hotel.description, price: hotel.price, amenities: hotel.amenities)
                                            .frame(height: 80)
                                            .foregroundColor(.white)
                                            .cornerRadius(6)
                                        
                                        VStack(alignment: .leading, spacing: 5) {
                                            HStack {
                                                // Sterne anzeigen, basierend auf der Bewertung des Hotels
                                                ForEach(0..<hotel.rating) { _ in
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.yellow)
                                                }
                                                // Weitere Informationen zum Hotel anzeigen
                                                // Text("\(hotel.rating) Stars")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.all)
                }
            }
        }
        .navigationBarTitle("Hotels") // Titel für die Navigationsleiste
    }
}

// Hier ist die Preview für die HotelListView-Ansicht.
struct HotelListView_Previews: PreviewProvider {
    private static var HotelListViewisShowing = Binding.constant(false)
    static var previews: some View {
        HotelListView(HotelListViewisShowing: .constant(true))
    }
}
