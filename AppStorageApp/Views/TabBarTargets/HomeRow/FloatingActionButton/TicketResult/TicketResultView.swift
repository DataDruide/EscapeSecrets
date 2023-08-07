import SwiftUI

struct TicketResultView: View {
    // Properties
    var departureCity: String
    var arrivalCity: String
    var fn: String
    var departure: Date
    var checked: Bool
    var smoker: Bool
    var pets: Bool
    @State private var seatSelection: String = ""
    
    var body: some View {
        ZStack {
            // Hintergrundfarbe Schwarz
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                // Flight Information Section
                Section(header: Text("Flight Informations").foregroundColor(.yellow)) {
                    Text("Departure Location: \(departureCity)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Text("Arrival Location: \(arrivalCity)")
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
                    Text(smoker ? "Smoking allowed" : "Smoking not allowed")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Text(pets ? "Pets allowed" : "No pets allowed")
                        .font(.subheadline)
                        .foregroundColor(.white)

                }
                
                // Select Your Seat Section
                Section(header: Text("Select Your Seat").foregroundColor(.yellow)) {
                    HStack(spacing: 20) {
                        SeatButton(selection: $seatSelection, title: "Window") // Fensterplatz
                        SeatButton(selection: $seatSelection, title: "Middle")// Mittelsitz
                        SeatButton(selection: $seatSelection, title: "Aisle")// Gang
                    }

                    .padding(.vertical, 10)
                    
                    Text("Please select your preferred seat.")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)

                    Button(action: {
                        // Speichern Sie den ausgewählten Sitzplatz in einer Datenbank oder führen Sie andere Aktionen aus.
                    }, label: {
                        Text("Save")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
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
                    .padding(.bottom, 10)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct SeatButton: View {
    @Binding var selection: String
    let title: String
    
    var body: some View {
        Button(action: {
            selection = title
        }, label: {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.orange))
                .cornerRadius(10)
        })
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
        .preferredColorScheme(.dark)
    }
}
