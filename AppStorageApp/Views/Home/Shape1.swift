//
//  DashRow1.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 16.03.23.
//


import SwiftUI

struct Shape1: View {
    @EnvironmentObject var authService : AuthService
    @State private var showMenu = false
    var body: some View {
        NavigationLink(destination: YourWayView(show: $showMenu)) {
            VStack {
                Button("LogOut"){
                    authService.signOut()
                }
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
                .bold()
                .font(.system(size: 12))

                Text("Hi nice to see you again ... \(authService.user?.email ?? "")!")
                    .padding()
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 10))
                    .foregroundColor(.black)

            }
        }
        .buttonStyle(BorderlessButtonStyle()) // Ändern des Stils des Buttons
    }
    
}

