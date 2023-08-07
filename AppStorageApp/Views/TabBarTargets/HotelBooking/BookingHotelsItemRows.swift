import SwiftUI

struct BookingHotelsItemRows: View {
    // Zustand von TripType wird benötigt, um Elemente aus dem Warenkorb zu entfernen
    @EnvironmentObject var hotelType: HotelTypeViewModel // @EnvironmentObject, um den Zustand hotelType von außerhalb der Ansicht zu erhalten
    
    var hotel: Hotels // Das Hotel-Objekt, das in dieser Zeile dargestellt werden soll
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                // Bild des Elements
                Image(hotel.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 10) {
                    // Name des Elements
                    Text(hotel.name)
                        .bold()
                        .foregroundColor(.white)
                    
                    // Preis des Elements
                    Text("\(hotel.price)$")
                        .foregroundColor(.white)
                }
                
                Spacer() // Abstandshalter, um die Elemente nach links zu verschieben
                
                // Entfernen-Symbol, um Element aus dem Warenkorb zu entfernen
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.red)
                    .overlay(
                        Image(systemName: "trash")
                            .foregroundColor(.white)
                    )
                    .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                    .onTapGesture {
                        hotelType.removeFromCart(newItem: hotel) // Ruft die Funktion removeFromCart im hotelType auf, um das Element aus dem Warenkorb zu entfernen
                    }
                    .padding()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading) // Die Zeile wird die volle Breite der Ansicht einnehmen und die Elemente links ausrichten
        }
        .background(
            // Ein Farbverlauf wird als Hintergrund festgelegt
            LinearGradient(colors: [.gray.opacity(0.57), .gray.opacity(0.47)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all) // Der Farbverlauf wird über die gesamte Ansicht erstrecken und die sichere Fläche ignorieren
        )
    }
}

struct BookingHotelsItemRows_Previews: PreviewProvider {
    static var previews: some View {
        BookingHotelsItemRows(hotel: Hotels(name: "Hotel Test", title: "Test", image: "hotel1", rating: 4, description: "Test Description", price: 200, amenities: []))
            .environmentObject(HotelTypeViewModel()) // Hier wird der benötigte hotelType-Zustand für die Preview erstellt
    }
}
