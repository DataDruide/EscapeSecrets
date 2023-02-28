//
//  Home.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 28.02.23.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var authService : AuthService
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.3)
                .ignoresSafeArea()
            VStack {
                VStack{
                    Text("Hallo, \(authService.user?.email ?? "")!")
                    Button("Log Out"){
                        authService.signOut()
                        
                            CustomTabView()
                        
                    }
                }
                
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Home().environmentObject(AuthService())
                .previewInterfaceOrientation(.portrait)
        }
    }
    
}
