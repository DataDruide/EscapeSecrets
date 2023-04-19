import SwiftUI
import Foundation

struct TicketResultView: View {
    
    var departureCity: String
    var arrivalCity: String
    
    var fn: String
    var departure: Date
    var checked: Bool
    var smoker: Bool
    var pets: Bool
    @State private var seatSelection: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("DepartureCity: \(departureCity)")
                .font(.subheadline)
                .foregroundColor(.white)
            Text("ArrivalCity: \(arrivalCity)")
                .font(.subheadline)
                .foregroundColor(.white)
            Text(fn)
                .font(.title)
                .bold()
                .padding(.bottom, 5)
            Text("Departure: \(departure)")
                .font(.subheadline)
                .foregroundColor(.white)
            Text(checked ? "Checked baggage included" : "No checked baggage included")
                .font(.subheadline)
                .foregroundColor(.white)
            Text(smoker ? "Smoking allowed" : "No smoking allowed")
                .font(.subheadline)
                .foregroundColor(.white)
            Text(pets ? "Pets allowed" : "No pets allowed")
                .font(.subheadline)
                .foregroundColor(.white)
            
            Spacer()
            
            Text("Select your seat")
                .font(.title2)
                .bold()
                .padding(.bottom, 5)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Please select your seat:")
                    .font(.headline)
                    .foregroundColor(.white)
                
                HStack(spacing: 20) {
                    Button(action: {
                        seatSelection = "Window"
                    }, label: {
                        Text("Window")
                            .font(.subheadline)
                            .foregroundColor(seatSelection == "Window" ? .white : .white)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(seatSelection == "Window" ? Color.orange : Color.gray.opacity(0.5))
                            .cornerRadius(10)
                    })
                    
                    Button(action: {
                        seatSelection = "Middle"
                    }, label: {
                        Text("Middle")
                            .font(.subheadline)
                            .foregroundColor(seatSelection == "Middle" ? .white : .white)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(seatSelection == "Middle" ? Color.orange : Color.gray.opacity(0.5))
                            .cornerRadius(10)
                    })
                    
                    Button(action: {
                        seatSelection = "Aisle"
                    }, label: {
                        Text("Aisle")
                            .font(.subheadline)
                            .foregroundColor(seatSelection == "Aisle" ? .white : .white)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(seatSelection == "Aisle" ? Color.orange : Color.gray.opacity(0.5))
                            .cornerRadius(10)
                    })
                }
                
                Text("Please select your preferred seat location.")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                
                Button(action: {
                    // Save the selected seat to a database or perform other actions.
                }, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
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
                        .blur(radius: 0.5)
                    .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                })
                .padding(.bottom, 10)
                
                Spacer()
            }
            .padding(20)
        }
        .padding(20)
        .background(Color.black)

    }
}
                
struct TicketResultView_Previews: PreviewProvider {
    static var previews: some View {
        TicketResultView(
            departureCity: "New York",
            arrivalCity: "Los Angeles",
            fn: "AA1234",
            departure: Date(),
            checked: true,
            smoker: false,
            pets: true
        )
    }
}

