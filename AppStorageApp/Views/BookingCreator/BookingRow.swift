

import SwiftUI

struct BookingRow: View {
    @State private var fn = ""
    @State private var departure = Date()
    @State private var pin = "1234"
    @State private var checked = true
    @State private var smoker = false
    @State private var pets = false
    @State private var checkin  = Date()
    @State private var checkout = Date()
    @State private var rating: Double = 4
    var body: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            Form {
                Section(header: Text("Flight")) {
                    TextField("Flight No", text: self.$fn)
                    Toggle(isOn: self.$checked) {
                        Text("Luggage")
                        Image(systemName: "briefcase.fill")
                    }
                    DatePicker(selection: self.$departure) {
                        HStack {
                            Text("Departure")
                            Image(systemName: "airplane")
                        }
                    }
                    HStack {
                        Spacer()
                        Button("Send") { print("edit hotel") }
                    }
                }
                Section(header: Text("Accomodation")) {
                    Toggle(isOn: self.$smoker) {
                        Text("Smoking Room")
                        Image(systemName: "nosign")
                    }
                    Toggle(isOn: self.$pets) {
                        Text("Pets")
                        Image(systemName: "tortoise.fill")
                    }
                    HStack {
                        Spacer()
                        Button("Send") { print("edit hotel") }
                    }
                }
                Section(header: Text("Booking")) {
                    Text("Rating \(Int(self.rating)) out of 5 :stern:️")
                    Slider(value: self.$rating, in: 1...5, step: 1)
                    SecureField("Pin", text: self.$pin)
                }
            }
        }
    }
}


struct BookingRow_Previews: PreviewProvider {
    static var previews: some View {
       
        
        BookingRow()
           
    }
}

