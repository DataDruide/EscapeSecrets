//
//  Home.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI



struct Home: View {
    @StateObject var jobViewModel: JobListViewModel = JobListViewModel()
    @StateObject var flightViewModel: FlightSearchViewModel = FlightSearchViewModel()
    @StateObject var reiseZieleModel: ReiseZieleViewModel = ReiseZieleViewModel()
    var body: some View {
        TabView {
            
            HomeRow(reiseZieleModel: ReiseZieleViewModel())
            .tabItem {
                VStack {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")

                    }
                       

                }
            }.tag(1)
            
               PlaneRow(viewModel: FlightSearchViewModel())
                .tabItem {
                    VStack {
                        VStack {
                            Image(systemName: "airplane.departure")
                            Text("Abflug")
                        }

                    }
                }.tag(2)
                JobRow(viewModel: JobListViewModel())
                    .tabItem {
                        VStack {
                           VStack {
                            Image(systemName: "book")
                            Text("Job")
                        }

                    }
                }.tag(3)
                ProfileRow()
                .tabItem {
                    VStack {
                        VStack {
                            Image(systemName: "person.crop.circle")
                            Text("Account")
                        }
                        

                    }
                }.tag(4)
        }
        .background(.thinMaterial)

    }
        struct Home_Previews: PreviewProvider {
            static var previews: some View {
                Home().environmentObject(AuthService())
                    .previewInterfaceOrientation(.portrait)
            }
        }
        
    }

