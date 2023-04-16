//
//  DashRow1.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 16.03.23.
//


import SwiftUI

import SwiftUI

struct Shape1: View {
    
    @State private var showYourWayView = false
    @EnvironmentObject var authService: AuthService
    @State private var showMenu = false
    @State private var showNextView = false
    var username: String
    
    var body: some View {
        
        
        VStack {
            HStack {
                
                Button(action: {
                    self.showYourWayView = true
                    authService.signOut()
                }) {
                    HStack {
                        Image(systemName: "figure.walk.arrival")
                        Text(authService.user?.email ?? "")
                    }
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .blur(radius: 0.5)
                    .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                }
                .sheet(isPresented: $showYourWayView) {
                    AfterOnBoarding()
                }
            }
            
        }
    }
}
struct Shape1_Previews: PreviewProvider {
    static var previews: some View {
        Shape1(username: "Max Mustermann")
            .environmentObject(AuthService())
    }
}


