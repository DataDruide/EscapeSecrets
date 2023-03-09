//
//  HomeRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//

import SwiftUI

struct HomeRow: View {
    @EnvironmentObject var authService : AuthService
    @StateObject var reiseViewModel: ReiseAuswahlViewModel = ReiseAuswahlViewModel()
    
    @State private var searchText = ""
    @State private var showMenu = false
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    Image("BG")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .opacity(0.75)
                        .frame(height: 250)
                        .ignoresSafeArea()
                        .padding(.top)
                        .position(x:196,y:50)
                    
                    HStack {
                        Button("LogOut"){
                            
                            authService.signOut()
                        }
                        .padding()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .bold()
                        .background(.orange)
                        .cornerRadius(15)
                        Text("Hi schön dich wiederzusehen ... \(authService.user?.email ?? "")!")
                            .padding().padding()
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.top)
                    .position(x:200,y:50)
                    
                    Image("airbus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 350)
                        .position(x:100,y:150)
                    
                    NavigationLink(destination: MultiBookingView()) {
                                        Image("createticket") // Bild aus Assets.xcassets
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .position(x:100,y:300)

                        
                                    }
                                    .buttonStyle(BorderlessButtonStyle()) // Ändern des Stils des Buttons
                                    
                    
                }
                
                // Search bar
                HStack {
                    TextField("Search hotels...", text: $searchText)
                        .padding(8)
                        .background(Color(.white))
                        .opacity(0.3)
                        .cornerRadius(8)
                        .padding(.horizontal, 16)
                    
                    Button(action: {
                        // Filter action
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.orange)
                    }
                    .padding(.trailing, 16)
                }
                .padding(.top)
                
                
                List {
                    NavigationLink(destination: HotelDetailRow1().environmentObject(ReiseAuswahlViewModel())) {
                        CountryDetailView(imageName: "hotel1", hotelName:  "Rom",stars: "star.fill" ,price: 650)
                    }
                    NavigationLink(destination: HotelDetailRow2()) {
                        CountryDetailView(imageName: "hotel2", hotelName:  "St.Bernandino",stars: "star.fill" ,price: 450)
                    }
                    .padding(.top)
                    NavigationLink(destination: HotelDetailRow3()) {
                        CountryDetailView(imageName: "hotel3", hotelName:  "Schöne Wohnung mit spektakulärem Meerblick",stars: "star.fill" ,price: 250)
                    }
                    
                    
                }
                
            }
        }
         .navigationBarItems(trailing:
             Button(action: {
                 self.showMenu.toggle()
             }) {
                 Image(systemName: "line.horizontal.3")
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 20, height: 20)
                     .foregroundColor(.orange)
             }
             .popover(isPresented: $showMenu, content: {
                 // Menu dropdown content
                 Text("Menu")
                     .padding()
             })
         )
     }
     
 }
    struct HomeRow_Previews: PreviewProvider {
        static var previews: some View {
            HomeRow().environmentObject(AuthService())
        }
    }
    

