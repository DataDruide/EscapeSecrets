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
        VStack(alignment: .center){
            Text("Cart")    // Der Titel des Warenkorbs
                .font(.largeTitle).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
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

                
                
                Text("Total price is")  // Eine Nachricht, die anzeigt, dass es sich um den Gesamtpreis handelt
                Spacer()
                Text("$\(tripType.total)")  // Der Gesamtpreis
                Text("$\(hotelType.total)")  // Der Gesamtpreis
                Text("$\(flightType.total)")
                Button("PaymentButton") {}   // Ein Button, um zur Zahlungsseite zu gelangen
                    .padding()
                
            }
        }
        .background(Color.black)
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
