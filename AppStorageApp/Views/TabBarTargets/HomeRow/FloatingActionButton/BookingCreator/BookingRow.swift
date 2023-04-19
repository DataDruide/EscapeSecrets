
import SwiftUI


struct BookingRow: View {
    @State private var fn = ""
    @State private var departure = Date()
    @State private var checked = true
    @State private var smoker = false
    @State private var pets = false
    @State private var checkin  = Date()
    @State private var checkout = Date()
    @State private var showingTicketResult = false
    @State private var from = ""
    @State private var to = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20) {
                VStack(alignment: .center, spacing: 20) {
                    
                    Form {
                        Section(header: Text("Flug").foregroundColor(.black)) {
                            TextField("Flugnummer", text: self.$fn)
                                .foregroundColor(.black)
                               // .accentColor(.black)
                                .keyboardType(.numbersAndPunctuation)
                            TextField("originLocation", text: self.$from)
                                .foregroundColor(.black)
                            TextField("arrivedLocation", text: self.$to)
                                .foregroundColor(.black)
                            Toggle(isOn: self.$checked) {
                                Text("Baggace")
                                    .foregroundColor(Color(red: 75/255, green: 115/255, blue: 115/255))
                                Image(systemName: "briefcase.fill")
                                    .foregroundColor(.black)
                            }
                            DatePicker(selection: self.$departure) {
                                HStack {
                                    Text("DepartureDate")
                                        .foregroundColor(Color(red: 75/255, green: 115/255, blue: 115/255))
                                        .font(.subheadline)
                                    Image(systemName: "airplane")
                                        .foregroundColor(Color(red: 75/255, green: 115/255, blue: 115/255))
                                }
                            }
                        }
                        Section(header: Text("Accommodation").foregroundColor(.white)) {
                            Toggle(isOn: self.$smoker) {
                                Text("Smoker")
                                    .foregroundColor(Color(red: 75/255, green: 115/255, blue: 115/255))
                                Image(systemName: "nosign")
                                    .foregroundColor(Color(red: 75/255, green: 115/255, blue: 115/255))
                            }
                            Toggle(isOn: self.$pets) {
                                Text("Pets")
                                    .foregroundColor(Color(red: 75/255, green: 115/255, blue: 115/255))
                                Image(systemName: "tortoise.fill")
                                    .foregroundColor(Color(red: 75/255, green: 115/255, blue: 115/255))
                            }
                        }
                        
                    }
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(25)
                    
                    Button(action: {
                        self.showingTicketResult = true
                    }, label: {
                        Text("Senden")
                            .foregroundColor(Color(red: 75/255, green: 115/255, blue: 115/255))
                            .background(Color.black)
                    })
                    
                }
                .padding()
                .background(Color(red: 75/255, green: 115/255, blue: 115/255))
                .cornerRadius(25)
                
            }
            .sheet(isPresented: $showingTicketResult) {
                TicketResultView(
                    departureCity: self.from,
                    arrivalCity: self.to,
                    fn: self.fn,
                    departure: self.departure,
                    checked: self.checked,
                    smoker: self.smoker,
                    pets: self.pets
                )
                .background(Color.gray)
            }

        }
    }
    
    struct BookingRow_Previews: PreviewProvider {
        static var previews: some View {
            BookingRow()
                .preferredColorScheme(.dark)
        }
    }
}
