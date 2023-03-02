//
//  HomeRow.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//

import SwiftUI

struct HomeRow: View {
    @EnvironmentObject var authService : AuthService
    @StateObject var reiseZieleModel: ReiseZieleViewModel = ReiseZieleViewModel()
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
                .background(Image("berge"))
                .ignoresSafeArea()
                
                List(self.reiseZieleModel.reiseZieleModels) { item in
                    NavigationLink(destination: {
                        ShowHomeView(theDescription: "", imageName: "", reiseURL: "")
                        
                    }, label: {
                        ItemListView(
                            name: item.name,
                            hotelStars: item.hotelStars,
                            reiseImage: item.reiseImage)
                    })
                }
                .navigationTitle("Top Reisen")
                
            }
        }
    }
}
struct HomeRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeRow().environmentObject(AuthService())
    }
}
