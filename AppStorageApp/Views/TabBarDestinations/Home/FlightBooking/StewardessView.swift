//
//  StewardessView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 05.04.23.
//

import SwiftUI
import AVKit


struct StewardessView: View {
    
    @State private var showSeatSelectionView = false
    @State private var showVideoView = false
    @State private var searchText = ""
    @State private var showSearchBar = false

    var body: some View {
        
        NavigationStack {
            
            Button(action: {
                showSeatSelectionView = true
            }) {
                Text("Booking Now")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(
                                Color(
                                    red: 255 / 255,
                                    green: 115 / 255,
                                    blue: 115 / 255
                                )
                            )
                    )
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
            }
            .sheet(isPresented: $showSeatSelectionView) {
                NavigationView {
                    FlightSeatSelectionView()
                        .navigationBarItems(
                            leading: Button(action: {
                                showSeatSelectionView = false
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.red)
                            }
                        )
                }
            }
            
           
                    
                    ZStack {
                        Image("Stewardess")
                            .resizable()
                            .scaledToFill()
                            .opacity(0.8)
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            Text("YOUR FLIGHT\nSEARCHHELPER")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity, maxHeight: 60)
                                .background(Color.red)
                                .cornerRadius(30)
                                .padding()
                            
                            
                           //  TravelDiscoveryView()
                            
                            Spacer()
                            
                            
                            HStack(spacing: 30) {
                                Button(action: {
                                    showSearchBar = true
                                }) {
                                    Text("Search")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 50)
                                        .padding(.vertical, 16)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .foregroundColor(
                                                    Color(
                                                        red: 255 / 255,
                                                        green: 115 / 255,
                                                        blue: 115 / 255
                                                    )
                                                )
                                        )
                                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
                                }
                                .sheet(isPresented: $showSearchBar) {
                                    NavigationView {
                                        BookingViewHelper(searchText: $searchText)
                                            .navigationBarItems(
                                                leading: Button(action: {
                                                    showSearchBar = false
                                                }) {
                                                    Image(systemName: "chevron.left")
                                                        .foregroundColor(.red)
                                                }
                                            )
                                    }
                                }
                                
                                Button(action: {
                                    showVideoView = true
                                }) {
                                    Text("Intromovie")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 50)
                                        .padding(.vertical, 16)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .foregroundColor(
                                                    Color(
                                                        red: 255 / 255,
                                                        green: 115 / 255,
                                                        blue: 115 / 255
                                                    )
                                                )
                                        )
                                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
                                }
                                .sheet(isPresented: $showVideoView) {
                                    NavigationView {
                                        VideoView()
                                            .navigationBarItems(
                                                leading: Button(action: {
                                                    showVideoView = false
                                                }) {
                                                    Image(systemName: "chevron.left")
                                                        .foregroundColor(.red)
                                                }
                                            )
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
    }

