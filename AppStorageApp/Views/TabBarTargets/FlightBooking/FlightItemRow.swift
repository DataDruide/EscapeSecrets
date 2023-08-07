
import SwiftUI

struct FlightItemRow: View {
    // Zustand von TripType wird benötigt, um Elemente aus dem Warenkorb zu entfernen
    @EnvironmentObject var flightType : FlightTypeViewModel
    
    var flight : Flights
    
    var body: some View {
        ZStack {
            // Ein Farbverlauf wird als Hintergrund festgelegt
            LinearGradient(colors: [.gray.opacity(0.57), .gray.opacity(0.47)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                HStack(spacing:20) {
                    // Bild des Elements
                    Image(flight.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading, spacing: 10){
                        // Name des Elements
                        Text(flight.name)
                            .bold()
                            .foregroundColor(.white)
                        
                        // Preis des Elements
                        Text("\(flight.price)$")
                            .foregroundColor(.white)
                        
                    }
                    Spacer()
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
                            flightType.removeFromCart(newItem: flight)
                        }
                        .padding()
                    
                    
                }
                .padding(.horizontal)
                .frame(maxWidth:.infinity,alignment: .leading)
            }
        }
    }
    
}
struct FlightItemRow_Preview: PreviewProvider {
    static var previews: some View {
        let flight = Flights(name: "Sample Flight", image: "sample_image", description: "Sample description", price: 99, duration: "2h 30m", departureTime: "10:00 AM", arrivalTime: "12:30 PM", origin: "ABC", destination: "XYZ", stops: 1, airlineCode: "ABC123", baggageAllowance: "20 kg", wifiAvailability: true, inFlightEntertainment: true, mealIncluded: true)
        let flightType = FlightTypeViewModel()
        
        return FlightItemRow(flight: flight)
            .environmentObject(flightType)
            .previewLayout(.fixed(width: 375, height: 150))
    }
}
