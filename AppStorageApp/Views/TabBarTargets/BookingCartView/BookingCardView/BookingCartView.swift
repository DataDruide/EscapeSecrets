
// MARK: - PROPERTY


import SwiftUI

// Die Ansicht zum Anzeigen des Warenkorbs
struct BookingCartView: View {
    @EnvironmentObject var tripType : TripTypeViewModel  // Die Umgebungsvariable, um auf den Warenkorb zuzugreifen
    @EnvironmentObject var hotelType : HotelTypeViewModel  // Die Umgebungsvariable, um auf den Warenkorb zuzugreifen
    @EnvironmentObject var flightType : FlightTypeViewModel  // Die Umgebungsvariable, um auf den Warenkorb zuzugreifen

    // MARK: - BODY

    var body: some View {
        ZStack{
            
            Image("studentonroad")
                .resizable()
                .scaledToFill()
                .overlay(Rectangle())
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.black.opacity(0.55))
                .contrast(0.7)
                .offset(x: -20)
                .opacity(01.05)
            
            
            Spacer()
            VStack {
                
                ScrollView{    // Ein ScrollView, um durch die Elemente des Warenkorbs zu scrollen
                    
                    if tripType.activities.count > 0 && hotelType.hotels.count > 0 && flightType.flights.count > 0 {
                        // Wenn es Elemente im Warenkorb gibt
                        ForEach(tripType.activities, id: \.id) { activities in
                            DetailActivityRow(activity: activities)  // Die Ansicht zum Anzeigen eines Elements im Warenkorb
                        }
                        .padding()
                        ForEach(hotelType.hotels, id: \.id) { hotels in
                            BookingHotelsItemRows(hotel: hotels)  // Die Ansicht zum Anzeigen eines Elements im Warenkorb
                        }
                        .padding()

                        ForEach(flightType.flights, id: \.id) { flights in
                            FlightItemRow(flight: flights)  // Die Ansicht zum Anzeigen eines Elements im Warenkorb
                        }
                        .padding()

                    } else if tripType.activities.count == 0 && hotelType.hotels.count == 0 && flightType.flights.count == 0 {
                        // Wenn es keine Elemente im Warenkorb gibt
                        VStack(alignment: .center) {
                            // Füge einen Text hinzu.
                            Text("Your cart is empty")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.horizontal, 120 )
                                .padding(.vertical, 16)
                        }
                        .background(LinearGradient(colors: [.green, .clear], startPoint: .topLeading, endPoint: .bottomTrailing), in: Capsule())
                        .shadow(color: .black.opacity(0.6), radius: 5, x:15, y: 50)
                        .position(x:160, y:78) // hier stellt man den grünen Rahmen auf ihre richtige Position
                        
                            .padding()
                        
                    } else if tripType.activities.count > 0 && hotelType.hotels.count == 0 && flightType.flights.count == 0  {
                        // Wenn es nur Aktivitäten im Warenkorb gibt
                        ForEach(tripType.activities, id: \.id) { activities in
                            DetailActivityRow(activity: activities)  // Die Ansicht zum Anzeigen eines Elements im Warenkorb
                        }
                    } else if tripType.activities.count == 0 && hotelType.hotels.count > 0 && flightType.flights.count > 0 {
                        // Wenn es nur Hotels im Warenkorb gibt
                        ForEach(flightType.flights, id: \.id) { flights in
                            FlightItemRow(flight: flights)  // Die Ansicht zum Anzeigen eines Elements im Warenkorb
                        }
                    }
                    
                    
                    VStack(alignment: .center) {
                        HStack {
                            Text("Totalprice of Trips:")
                                .foregroundColor(.white)
                            Spacer()
                            Text("$\(tripType.total)")
                                .foregroundColor(.white)
                                .overlay(Rectangle().frame(height: 1).foregroundColor(.white), alignment: .bottom)
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Totalprice of Hotels:")
                                .foregroundColor(.white)
                            Spacer()
                            Text("$\(hotelType.total)")
                                .foregroundColor(.white)
                                .overlay(Rectangle().frame(height: 1).foregroundColor(.white), alignment: .bottom)
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Totalprice of Flights:")
                                .foregroundColor(.white)
                            Spacer()
                            Text("$\(flightType.total)")
                                .foregroundColor(.white)
                                .overlay(Rectangle().frame(height: 1).foregroundColor(.white), alignment: .bottom)
                            
                        }
                    }
                    .padding(40)

                    // 1 Button
                    Button(action: {
                        showAlert()
                    }, label: {
                        Text("Buy Now")
                            .font(.headline)
                            .foregroundColor(.white)
                            .blur(radius: 0.5)
                            .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(
                                        Color(
                                            red: 75 / 255,
                                            green: 115 / 255,
                                            blue: 115 / 255
                                        )
                                    )
                            )
                    })
                    .shadow(radius: 10)
                    
                }
            }
            .background(Color.black.opacity(0.47))
            .ignoresSafeArea(.all)
            .padding(20)

            
        }
        
    }
    // MARK: - Preview

    // Preview-Ansicht
    struct BookingCartView_Previews: PreviewProvider{
        static var previews: some View {
            BookingCartView()
                .environmentObject(FlightTypeViewModel())
                .environmentObject(HotelTypeViewModel())
                .environmentObject(TripTypeViewModel())


        }
    }
}


func showAlert() {
    let alert = UIAlertController(title: "Booking successfull!", message: "Thank you for booking.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
}
