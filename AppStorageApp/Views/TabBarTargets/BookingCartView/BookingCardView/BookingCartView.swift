//
//  BookingCartView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//
//
//  BookingCartView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.03.23.
//

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
                .offset(x: -110)
                .opacity(01.05)
            VStack(alignment: .trailing){
                
                VStack(alignment: .center, spacing: 50){
                    Spacer()
                        
                    ScrollView{    // Ein ScrollView, um durch die Elemente des Warenkorbs zu scrollen
                        
                        if tripType.activities.count > 0 && hotelType.hotels.count > 0 && flightType.flights.count > 0 {
                            // Wenn es Elemente im Warenkorb gibt
                            ForEach(tripType.activities, id: \.id) { activities in
                                DetailActivityRow(activity: activities)  // Die Ansicht zum Anzeigen eines Elements im Warenkorb
                            }
                            ForEach(hotelType.hotels, id: \.id) { hotels in
                                BookingHotelsItemRows(hotel: hotels)  // Die Ansicht zum Anzeigen eines Elements im Warenkorb
                            }
                            ForEach(flightType.flights, id: \.id) { flights in
                                FlightItemRow(flight: flights)  // Die Ansicht zum Anzeigen eines Elements im Warenkorb
                            }
                        } else if tripType.activities.count == 0 && hotelType.hotels.count == 0 && flightType.flights.count == 0 {
                            // Wenn es keine Elemente im Warenkorb gibt
                            Text("Your cart is empty!")    // Eine Nachricht, die anzeigt, dass der Warenkorb leer ist
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
                        
                        
                        
                        Text("Total price is")
                            .foregroundColor(.white)
                        Spacer()
                        Text("$\(tripType.total)")
                            .foregroundColor(.white)
                        
                        Text("$\(hotelType.total)")
                            .foregroundColor(.white)
                        
                        Text("$\(flightType.total)")
                            .foregroundColor(.white)
                        
                        // 1 Button
                        Button(action: {
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
                
            }
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
