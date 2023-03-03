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
            
                VStack(){
                    
                    HStack {
                        
                        Button("Log Out"){
                            
                            authService.signOut()
                        }
                        .padding().padding(.top, 50)
                        Text("Hi schön dich wiederzusehen ... \(authService.user?.email ?? "")!")
                            .padding().padding(.top, 50)
                        
                        
                    }
                    Text("Unsere Top Angebote\ndirekt auf Studenten zugeschnitten")
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: 300)
                        .background(.gray)
                    
                    
                    List(self.reiseViewModel.reiseZieleModels) { item in
                        NavigationLink(destination: {
                            ShowHomeView(theDescription: item.description, imageName: item.reiseImage, reiseURL: item.reiseURL)
                            
                        }, label: {
                            ItemListView(
                                name: item.name,
                                hotelStars: item.hotelStars,
                                reiseImage: item.reiseImage)
                        })
                        .background(.orange)
                    }
                    
                }
                .background(.gray)

                
            }
        }
    }
    struct HomeRow_Previews: PreviewProvider {
        static var previews: some View {
            HomeRow().environmentObject(AuthService())
        }
    }

