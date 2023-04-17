import SwiftUI
import Foundation

struct TicketResultView: View {
    
    var fn: String
    var departure: Date
    var checked: Bool
    var smoker: Bool
    var pets: Bool
    @State private var seatSelection: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(fn)
                .font(.title)
                .bold()
                .padding(.bottom, 5)
            Text("Departure: \(departure)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(checked ? "Checked baggage included" : "No checked baggage included")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(smoker ? "Smoking allowed" : "No smoking allowed")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(pets ? "Pets allowed" : "No pets allowed")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
            
            Text("Select your seat")
                .font(.title2)
                .bold()
                .padding(.bottom, 5)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Please select your seat:")
                    .font(.headline)
                    .foregroundColor(.black)
                
                HStack(spacing: 20) {
                    Button(action: {
                        seatSelection = "Window"
                    }, label: {
                        Text("Window")
                            .font(.subheadline)
                            .foregroundColor(seatSelection == "Window" ? .white : .black)
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
                            .foregroundColor(seatSelection == "Middle" ? .white : .black)
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
                            .foregroundColor(seatSelection == "Aisle" ? .white : .black)
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
                        .background(Color.orange)
                        .cornerRadius(10)
                })
                .padding(.bottom, 10)
                
                Spacer()
            }
            .padding(20)
        }
    }
}
                
     
struct Previews_TicketResultView_Previews: PreviewProvider {
    static var previews: some View {

        TicketResultView(fn: "Munich - Berlin",
                             departure: Date(),
                             checked: true,
                             smoker: false,
                             pets: false)
                .previewLayout(.fixed(width: 375, height: 200))
        }
        
    }

