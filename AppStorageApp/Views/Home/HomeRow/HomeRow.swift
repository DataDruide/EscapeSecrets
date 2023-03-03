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
                
                
                NavigationView {
                    List(self.reiseViewModel.reiseAuswahlModels) { item in
                        NavigationLink(destination: {
                            CountryDetailView(
                                theReise: item.reise,
                                imageName: item.reiseImage,
                                reiseURL: item.reiseURL)
                            .navigationBarTitle("",displayMode: .inline)
                        }, label: {
                            ItemListView(
                                name: item.name,
                                reiseImage: item.reiseImage)
                        })
                    }.navigationTitle("Reisen")
                }
                
            }
        }
    }
    struct HomeRow_Previews: PreviewProvider {
        static var previews: some View {
            HomeRow().environmentObject(AuthService())
        }
    }
    
}
