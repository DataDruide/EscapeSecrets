

import SwiftUI

struct PlaneRow: View {
    @StateObject var viewModel = FlightSearchViewModel()
    
    @State var sortOption: SortOption = .relevancy
    @State var priceRange: Double = 0.0
    @State var departureAirport: String = ""
    @State var destinationAirport: String = ""
    @State var travelClass: TravelClass = .economy
    
    
    @State var selectedDate = Date()
    @State var selectedPerson: String = ""
    let personOptions = ["Person 1", "Person 2", "Person 3"]
    
    @State private var isAnimating = false
    var body: some View {
        List{
            ZStack {
                Image("")
                Color.gray.opacity(0.15)
                    .frame(width: 375, height: 850)
                VStack {
                    
                    Text("Search your Flight")
                        .foregroundColor(.orange)
                        .font(.system(size: 24))
                    
                    Text("Hier können sie ihre Buchung\nganz unkompliziert buchen")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 13))
                        .fontWeight(.thin)
                        .foregroundColor(.gray)

                    Image("airplanestudy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                        .padding()
                        .animation(.easeInOut(duration: 0.5))
                
                    
                    Text("Hier können sie Filtern")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.orange)
                        .font(.system(size: 13))
                        .fontWeight(.thin)
                    VStack(alignment: .leading, spacing: 10) {
                        Picker(selection: $sortOption, label: Text("Sortieren nach:")) {
                            Text("Relevanz").tag(SortOption.relevancy)
                            Text("Preis").tag(SortOption.price)
                            Text("Dauer").tag(SortOption.duration)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    }
                    
                    Slider(value: $priceRange, in: 0...5000, step: 100) {
                        Text("Preisbereich")
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Von:")
                        TextField("Abflughafen", text: $departureAirport)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Nach:")
                        TextField("Zielflughafen", text: $destinationAirport)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("Reiseklasse")
                        Picker(selection: $travelClass, label: Text("Reiseklasse:")) {
                            Text("Economy").tag(TravelClass.economy)
                            Text("Business").tag(TravelClass.business)
                            Text("First").tag(TravelClass.first)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding()
                    
                    VStack{
                        Text("Reisende Pers.")
                            .foregroundColor(.orange)
                            .font(.system(size: 13))

                        Picker(selection: $selectedPerson, label: Text("Select a person")) {
                            ForEach(personOptions, id: \.self) { person in
                                Text(person)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                    }
                    
                    Button("Flüge abrufen") {
                        viewModel.fetchFlightDestinations {}
                    
                    }
                    .foregroundColor(.orange)
                 
                
                    // List zur Darstellung der Flugziele
                    List(viewModel.flightDestinations) { destination in
                        // VStack zur Anordnung der Textelemente in einer vertikalen Richtung
                        VStack(alignment: .leading) {
                            Text(destination.destination)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("From: \(destination.origin)")
                                .foregroundColor(.white)
                            Text("Departure Date: \(destination.departureDate)")
                                .foregroundColor(.white)
                            Text("Return Date: \(destination.returnDate)")
                                .foregroundColor(.white)
                            Text("Price: \(destination.price.total)")
                                .foregroundColor(.white)
                        }
                        .background(Color.black.opacity(0.2)) // Anpassung der Transparenz
                        .cornerRadius(10)
                        .padding()
                    }
                    .opacity(0.55)
                }
                .padding()
                    
                    
                    
                }
                .padding()
            }
        }
    }
    enum SortOption {
        case relevancy, price, duration
    }
    
    enum TravelClass {
        case economy, business, first
    }
