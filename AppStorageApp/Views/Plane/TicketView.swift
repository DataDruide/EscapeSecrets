//
//  TicketView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 24.03.23.
//

import SwiftUI

struct TicketView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Header
            VStack {
                Text("FLIGHT TICKET")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                Image("Flugticket")
                    .resizable()
                    .frame(width: 380, height: 200)

                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.93, green: 0.42, blue: 0.31), Color(red: 0.98, green: 0.74, blue: 0.28)]), startPoint: .top, endPoint: .bottom)
            )
            
            // Body
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Text("FROM")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("TO")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("New York")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Text("London")
                        .font(.title2)
                        .bold()
                }
                .padding(.bottom, 10)
                
                HStack {
                    Text("DEPARTURE")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("ARRIVAL")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Tue, 28 Dec 2021, 06:45")
                        .font(.subheadline)
                    Spacer()
                    Text("Tue, 28 Dec 2021, 12:45")
                        .font(.subheadline)
                }
                .padding(.bottom, 10)
                
                HStack {
                    Text("PASSENGER")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("SEAT")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("John Smith")
                        .font(.subheadline)
                    Spacer()
                    Text("24B")
                        .font(.subheadline)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Footer
            HStack {
                Text("PRICE")
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
                Text("$ 749.99")
                    .font(.title2)
                    .bold()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.93, green: 0.42, blue: 0.31), Color(red: 0.98, green: 0.74, blue: 0.28)]), startPoint: .top, endPoint: .bottom)
        )
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
