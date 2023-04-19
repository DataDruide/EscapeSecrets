//
//  DetailPlaceView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 13.04.23.
//

import SwiftUI


struct DetailPlaceView: View {
    
    // Zustandsvariable für die Anzeige der Job-Liste
    @State private var showJobRow = false
    
    var body: some View {
        
        ZStack {
          
            VStack(alignment: .center) {
                
                // Hintergrundbild
                Image("Head")
                    .resizable()
                    .multilineTextAlignment(.center)
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                
                // Inhalt der Detailansicht
                ScrollView {
                    VStack(alignment: .center) {
                        
                        // Titel "Location Details"
                        Text("Location Details")
                            .foregroundColor(.orange)
                            .font(.system(size: 44, weight: .semibold))
                            .blur(radius: 0.5)
                            .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                    }
                    
                    // Hauptinhalt
                    VStack(alignment: .center) {
                        
                        // Name und Bewertung des Hotels
                        HStack(spacing: 20) {
                            Text("Home Stay Kebota Jr.")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .blur(radius: 0.5)
                                .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                                .padding()
                            Spacer()
                            Image(systemName: "star")
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(.gray)
                            
                            Text("4.5")
                                .foregroundColor(.gray)
                                .padding()
                        }
                        
                        // Trennlinie
                        Divider()
                            .frame(width: 200)
                            .foregroundColor(.gray)
                        
                        // Adresse
                        VStack(alignment: .center) {
                            HStack(spacing: 20) {
                                Image(systemName: "pin")
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(.gray)
                                    .padding()
                                
                                Spacer()
                                
                                Text("Jl.Khatib Sulaiman")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                    .blur(radius: 0.5)
                                    .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                                    .padding()
                            }
                            
                            // Preis und Bewertungen
                            HStack(spacing: 20) {
                                Image("$ 244")
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(.gray)
                                    .padding()
                                
                                Spacer()
                                
                                Image("review")
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(.gray)
                                    .padding()
                                
                            }
                            
                            // Ausstattungsmerkmale
                            HStack {
                                VStack {
                                    Image(systemName: "wifi")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 30, height: 30)
                                        .padding()
                                    Text("Wifi")
                                }
                                VStack {
                                    Image(systemName: "cup.and.saucer")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 30, height: 30)
                                        .padding()
                                    Text("Coffee")
                                }
                                VStack {
                                    // Button für die Anzeige der Job-Liste
                                    Button(action: {
                                        self.showJobRow = true
                                    }, label: {
                                        VStack {
                                            Image(systemName: "graduationcap.circle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 30, height: 30)
                                                .padding()
                                            Text("Student Jobs")
                                        }
                                    })
                                }
                                .sheet(isPresented: $showJobRow) {
                                    JobRow(viewModel: JobListViewModel())
                                }
                                
                                VStack {
                                    Image(systemName: "figure.open.water.swim")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 30, height: 30)
                                        .padding()
                                    Text("Swimming")
                                }
                            }.foregroundColor(.yellow)
                            
                            
                            VStack(alignment: .trailing) {
                                HStack {
                                    Divider()
                                        .frame(width: 200)
                                        .foregroundColor(.gray);                           Image("See")
                                        .resizable()
                                        .frame(width: 130, height: 50, alignment: .leading)
                                        .aspectRatio(contentMode: .fill)
                                        .padding()
                                }
                            }
                            VStack(alignment: .center) {
                                Text("Located in the Province Region, in the Local of a Interest Point, Italia a little more Nature ... Read More")
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.gray)
                                    .padding()
                                
                                
                            }
                            VStack(alignment: .trailing) {
                                
                                Image("Map")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(20)
                                    .blur(radius: 0.5)
                                    .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                                    .padding()
                                
                            }
                            
                            // Login button
                            Button(action: {
                                
                            }, label: {
                                Text("Book Now")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 60)
                                    .padding(.vertical, 16)
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
                            
                        }
                    }
                    
                }.padding()
                    .background(Color.black.opacity(0.85))
                
            }
            
        }
    }
}
    struct DetailPlaceView_Previews: PreviewProvider {
        static var previews: some View {
            DetailPlaceView()
        }
    }









