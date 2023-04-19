import SwiftUI
import MapKit

struct HotelDetailView: View {
    
    var hotel: Hotels
    
    @EnvironmentObject var hotelType : HotelTypeViewModel
    
    
    // Initialisierungsfunktion
    init(hotel:Hotels){
        self.hotel = hotel
        
    }
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(colors: [.black.opacity(0.97), .black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    VStack(alignment: .center, spacing: 10){
                        
                        // Bild der Aktivität
                        Image(hotel.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                            .cornerRadius(10)
                            .padding([.horizontal, .bottom])
                            .padding(.top, 30)
                        
                        // Name der Aktivität
                        Text(hotel.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.bottom, 5)
                            .padding(.top, 10)
                        
                        VStack(alignment: .leading, spacing: 10){
                            
                            Text(hotel.description)
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .tracking(-1)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal)
                                .multilineTextAlignment(.center) // Hinzufügen von .multilineTextAlignment(.center)
                            
                            Divider()
                            
                            HStack(alignment: .center, spacing: 20) {
                                // Description of Prices
                                Text("\(hotel.price)$")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center) // Hinzufügen von .multilineTextAlignment(.center)
                                
                                // Description of Amenities
                                HStack(spacing: 5) {
                                    ForEach(hotel.amenities, id: \.self) { amenity in
                                        Text(amenity)
                                            .foregroundColor(.white)
                                            .font(.subheadline)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 5)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundColor(Color(red: 75/255, green: 115/255, blue: 115/255))
                                            )
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            
                            Divider()
                            VStack(alignment: .center, spacing: 20) {
                                
                                Button(action: {
                                    withAnimation {
                                        hotelType.addHotels(newItem: hotel)
                                        print("Added to the hotel booking list")
                                    }
                                }) {
                                    Text("Jetzt buchen")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.center)
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
                                        .multilineTextAlignment(.center) // Hinzufügen von .multilineTextAlignment(.center)

                                }
                                .shadow(radius: 10)
                                .padding(.top, 20)
                                .padding(.bottom, 60)
                                .padding()
                                
                            }
                        }
                        VStack(alignment: .center, spacing: 10){
                            // ...
                           
                        }
                        .frame(minHeight: UIScreen.main.bounds.height - 300)
                    }
                }
            }
        }
        
    }
}
