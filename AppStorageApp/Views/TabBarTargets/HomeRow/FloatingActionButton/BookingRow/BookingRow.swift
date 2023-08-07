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
    @State private var vacationEndDate = Date()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20) {
                
                Section(header: Text("Flight Informations").font(.headline).foregroundColor(.yellow)) {
                    TextField("Flight Number", text: self.$fn)
                        .foregroundColor(.white)
                        .keyboardType(.numbersAndPunctuation)
                    TextField("Departure", text: self.$from)
                        .foregroundColor(.white)
                    TextField("Origin", text: self.$to)
                        .foregroundColor(.white)
                    Toggle(isOn: self.$checked) {
                        Text("Suitcase")
                            .foregroundColor(Color(red: 75/255, green: 115/255, blue: 115/255))
                        Image(systemName: "briefcase.fill")
                            .foregroundColor(.white)
                    }
                }
                
                Section(header: Text("Bonus Services").font(.headline).foregroundColor(.yellow)) {
                    Toggle(isOn: self.$smoker) {
                        Text("Smoker")
                            .foregroundColor(.yellow)
                        
                    }
                    Toggle(isOn: self.$pets) {
                        Text("Pets")
                            .foregroundColor(.yellow)
                        Image(systemName: "tortoise.fill")
                            .foregroundColor(.yellow)
                    }
                }
                
                Section(header: Text("Booking").font(.headline).foregroundColor(.yellow)) {
                    DatePicker(selection: self.$checkin) {
                        Text("Check-In Date")
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                    DatePicker(selection: self.$checkout) {
                        Text("Check-Out Date")
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                }
                
                Section(header: Text("Vacation End Date").font(.headline).foregroundColor(.yellow)) {
                    DatePicker(selection: self.$vacationEndDate) {
                        HStack {
                            Text("Vacation End Date")
                                .foregroundColor(Color(red: 75/255, green: 115/255, blue: 115/255))
                                .font(.subheadline)
                            Image(systemName: "airplane")
                                .foregroundColor(Color(red: 75/255, green: 115/255, blue: 115/255))
                        }
                    }
                }
                
                Button(action: {
                    self.showingTicketResult = true
                }, label: {
                    Text("Enter")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
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
                        .cornerRadius(25)
                })
                
            }
            .padding()
            .background(Color(red: 35/255, green: 35/255, blue: 35/255))
            .cornerRadius(25)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
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
