//
//  HomeRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//

import SwiftUI



struct HomeRow: View {
    @EnvironmentObject var authService : AuthService
    @StateObject var reiseViewModel: ReiseZieleViewModel = ReiseZieleViewModel()
    var body: some View {
        NavigationView {
            List(self.reiseViewModel.reiseZieleModels) { item in
                NavigationLink(destination: {
                    ShowHomeView(
                        theDescription: item.description,
                        imageName: item.reiseImage, reiseURL: "")
                        
                }, label: {
                    ItemListView(
                        name: item.name,
                        hotelStars: item.hotelStars,
                        reiseImage: item.reiseImage)
                })
            }.navigationTitle("Top Reisen")
                    HStack {
                    Text("Hallo, \(authService.user?.email ?? "")!")
                          
                        Button("Log Out"){
                            authService.signOut()
                        }
                    }
                }
            }
        }
