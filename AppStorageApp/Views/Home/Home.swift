//
//  Home.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI



struct Home: View {
    
    @State var selectedTab = 0
    @StateObject var jobViewModel: JobListViewModel = JobListViewModel()
    @StateObject var flightViewModel: FlightSearchViewModel = FlightSearchViewModel()
    @StateObject var reiseZieleModel: ReiseAuswahlViewModel = ReiseAuswahlViewModel()
    var body: some View {
            TabView {
                HomeRow(reiseViewModel: ReiseAuswahlViewModel())
                    .tabItem {
                        VStack {
                            VStack {
                                Image(systemName: "house.fill")
                                Text("Home")
                                
                            }
         
                        }
                    }.tag(0)
                
                MultiBookingView(viewModel: FlightSearchViewModel())
                    .tabItem {
                        VStack {
                            VStack {
                                Image(systemName: "airplane.departure")
                                Text("Flightsearch")
                            }
                            
                        }
                    }.tag(1)
                JobRow(viewModel: JobListViewModel())
                    .tabItem {
                        VStack {
                            VStack {
                                Image(systemName: "graduationcap.fill")
                                Text("Job")
                            }
                            
                        }
                    }.tag(2)
                CreateProfilView()
                    .tabItem {
                            VStack {
                                Image(systemName: "person.crop.circle")
                                Text("MyProfil")
                            }
                            
                            
                        
                    }.tag(3)
            }
            .frame(width: nil, height: nil)
            .background(.thinMaterial)
            
            
        }

    }
    
        struct Home_Previews: PreviewProvider {
            static var previews: some View {
                Home().environmentObject(AuthService())
                    .previewInterfaceOrientation(.portrait)
                
            }
        }
        
    

