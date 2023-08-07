import SwiftUI
import MapKit

struct HotelDetailView: View {
    
    var hotel: Hotels
    
    @EnvironmentObject var hotelType: HotelTypeViewModel
    
    // Initializer
    init(hotel:Hotels){
        self.hotel = hotel
    }
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(colors: [.black.opacity(0.97), .black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 10) {
                    
                    // Image of the hotel
                    Image(hotel.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .padding(.top, 30)
                    
                    // Name of the hotel
                    Text(hotel.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 5)
                        .padding(.top, 10)
                    
                    // Description of the hotel
                    Text(hotel.description)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .tracking(-1)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom)
                        
                    // Description of Prices and Amenities
                    HStack(alignment: .center, spacing: 20) {
                        Text("\(hotel.price)$")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
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
                    .padding(.bottom)
                    
                    // Button to book the hotel
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
                            .multilineTextAlignment(.center)
                    }
                    .shadow(radius: 10)
                    .padding(.top, 20)
                    .padding(.bottom, 60)
                    .padding()
                    
                    VStack(spacing: 10) {
                        // ... (rest of the code remains unchanged)
                    }
                    .frame(minHeight: UIScreen.main.bounds.height - 300)
                }
            }
        }
        
    }
}
