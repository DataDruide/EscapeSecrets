//
//  FlightDetailView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 30.03.23.
//

import SwiftUI

struct FlightDetailView: View {
    
    var flight: Flights
       
       @EnvironmentObject var flightType : FlightTypeViewModel
       @State var rotationAngle = 0.0

       init(flight:Flights){
           self.flight = flight
       }
    
    @State var remainingTime = 3600 // an example initial value
    
    let countdownTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.black.opacity(0.97), .black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(alignment: .center, spacing: 10){
                    
                    HStack(alignment: .top){
                        Image(flight.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 3))
                            .shadow(radius: 7)
                            .rotationEffect(.degrees(rotationAngle))
                            .animation(Animation.linear(duration: 2).repeatForever())

                    }
                    
                    Text(flight.name)
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .padding(.top)
                    
                    Text(flight.description)
                        .foregroundColor(.white)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("$\(flight.price)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                    Button(action: {
                        withAnimation {
                        flightType.addFlights(newItem: flight)
                            print("Added to the flight booking list")
                    }
                    }) {
                    Text("Book Now")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 16)
                            .background(
                                Capsule()
                                .foregroundColor(Color(red: 75 / 255, green: 115 / 255, blue: 115 / 255))
                                               )
                    }
                    .shadow(radius: 10)
                    .padding(.top, 40)
                    .padding(.bottom, 60)
                    
                    // Countdown Widget
                    CountdownCircle(remainingTime: Double(remainingTime))
                        .frame(width: 120, height: 120)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black.opacity(0.7))
                    .shadow(radius: 7)
            )
        }
        .onReceive(countdownTimer) { currentDate in
            let endTime = Date(timeIntervalSinceReferenceDate: TimeInterval(remainingTime))
            let components = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: endTime)
            remainingTime -= 1
            
            if remainingTime < 0 {
                countdownTimer.upstream.connect().cancel()
            }
        }
    }
}

struct CountdownCircle: View {
    let remainingTime: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.3)
                .foregroundColor(Color.white)
            
            Text("\(formattedTime)")
                .font(.headline)
                .foregroundColor(.white)
        }
    }
    var formattedTime: String {
        let hours = Int(remainingTime) / 3600
        let minutes = Int(remainingTime) / 60 % 60
        let seconds = Int(remainingTime) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

}
//struct FlightDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        FlightDetailView(flight: Flights(name: "flight1", image: "Turkish Airlines", description: "Türkisch Airline", price: 399))
//    }
//}

