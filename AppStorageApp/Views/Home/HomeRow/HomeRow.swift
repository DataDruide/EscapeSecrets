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
            List(self.reiseZieleModel.reiseZieleModels) { item in
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
            }
            .listStyle(.plain) // Für ein vollständiges Ausblenden benötigen Sie eine "plain"-ListStyle
            .transition(.opacity) // Verwenden Sie die Opacity-Transition für die Ausblendung
            .animation(.easeOut(duration: 0.5)) // Verwenden Sie die Ease-Out-Animation für eine sanfte Wirkung
            .navigationTitle("Top Reisen")
            VStack{
                Text("Hallo, \(authService.user?.email ?? "")!")
                Button("Log Out"){
                    authService.signOut()
                }
            }
                }
            }
        }

struct HomeRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeRow().environmentObject(AuthService())
    }
}
