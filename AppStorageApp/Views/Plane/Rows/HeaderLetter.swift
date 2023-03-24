//
//  HeaderLetter.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 24.03.23.
//
//import SwiftUI
//
//struct HeaderLetter: View {
//    @Binding var arrived: String
//    @Binding var origin: String
//    @Binding var startTravel: Date
//    @Binding var isRoundTrip: Bool
//    @State var selectedTravelStory: String = "OneWay"
//
//    let airportCodes = ["NYC", "LAX", "SFO", "ORD", "ATL", "DFW", "EWR", "MIA", "PDX", "HOU", "MUC"] // Beispiel-Liste von Flughafencodes
//
//    var body: some View {
//        ZStack {
//            Image("Group 3")
//                .resizable()
//                .frame(width: 340, height: 560)
//                .cornerRadius(50)
//            HeaderSubRow(isRoundTrip: $isRoundTrip, selectedTravelStory: selectedTravelStory)
//                .zIndex(1)
//                .position(x:180,y:30)
//                .padding(.top, 5)
//
//                .padding(.bottom, 20)
//
//            HStack {
//                VStack {
//                    Image("flighticon")
//                        .resizable()
//                        .frame(width: 100, height: 250)
//                        .padding()
//
//
//                }
//                VStack(alignment: .leading, spacing: 10) {
//                    Text("From")
//                        .font(.custom("Helvetica", size: 14))
//                        .foregroundColor(.white)
//                        .bold()
//                    Text(origin.description)
//                        .padding(.horizontal, 10)
//                        .foregroundColor(.white)
//                        .frame(width: 200, height: 45)
//                        .background(Color.gray.opacity(0.1))
//                        .cornerRadius(8)
//                        .autocapitalization(.allCharacters)
//
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(Color.white, lineWidth: 1)
//                        )
//                    Text("To")
//                        .font(.subheadline)
//                        .foregroundColor(.white)
//
//                        .bold()
//                    Text(arrived.description)
//                        .padding(.horizontal, 10)
//                        .foregroundColor(.white)
//                        .frame(width: 200, height: 45)
//                        .background(Color.gray.opacity(0.1))
//                        .cornerRadius(8)
//                        .autocapitalization(.allCharacters)
//
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(Color.white, lineWidth: 1)
//                        )
//
//                    Text("Date")
//                        .font(.subheadline)
//                        .foregroundColor(.white)
//
//                        .bold()
//                    Text("\(dateFormatter.string(from: $startTravel.wrappedValue))")
//                        .frame(width: 200, height: 45)
//                        .background(Color.gray.opacity(0.1))
//                        .foregroundColor(.white)
//
//                }
//            }
//            .padding(.horizontal, 20)
//        }
//    }
//}
//
//let dateFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "dd.MM.yyyy"
//    return formatter
//}()
