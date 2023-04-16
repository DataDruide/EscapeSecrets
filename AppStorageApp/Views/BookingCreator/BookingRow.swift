
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
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            VStack(alignment: .center, spacing: 20) {
                
                Form {
                    Section(header: Text("Flug")) {
                        TextField("Flugnummer", text: self.$fn)
                        Toggle(isOn: self.$checked) {
                            Text("Gepäck")
                            Image(systemName: "briefcase.fill")
                        }
                        DatePicker(selection: self.$departure) {
                            HStack {
                                Text("Abflug")
                                Image(systemName: "airplane")
                            }
                        }
                    }
                    Section(header: Text("Unterkunft")) {
                        Toggle(isOn: self.$smoker) {
                            Text("Raucherzimmer")
                            Image(systemName: "nosign")
                        }
                        Toggle(isOn: self.$pets) {
                            Text("Haustiere")
                            Image(systemName: "tortoise.fill")
                        }
                    }
                    
                    
                }
               // .padding()
                
                Button(action: {
                    self.showingTicketResult = true
                }, label: {
                    Text("Senden")
                })
                
            }
            .background(Image("flightsearchbg"))
            .padding()
            
        }
        .sheet(isPresented: $showingTicketResult) {
            TicketResultView(fn: self.fn, departure: self.departure, checked: self.checked, smoker: self.smoker, pets: self.pets)
        }
    }
}

struct BookingRow_Previews: PreviewProvider {
    static var previews: some View {
        BookingRow()
    }
}
