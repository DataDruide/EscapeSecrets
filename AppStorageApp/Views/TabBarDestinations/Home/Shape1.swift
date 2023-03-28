//
//  DashRow1.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 16.03.23.
//


import SwiftUI

struct Shape1: View {
    
    @State private var showYourWayView = false
    
    
    @EnvironmentObject var authService : AuthService
    @State private var showMenu = false
    var body: some View {
       // NavigationLink(destination: YourWayView(show: $showMenu)) {
            VStack {
                
                Button("LogOut"){
                    print("es funzt")
                    self.showYourWayView = true
                    authService.signOut()
                }
                .multilineTextAlignment(.leading)
                .padding(10)
                .foregroundColor(.red)
                .bold()
                .font(.system(size: 24))
                
                
                
                Text("Hi \(authService.user?.email ?? "")!")
                    .padding()
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16))
                    .foregroundColor(.green)
                
                    .sheet(isPresented: $showYourWayView) {
                        YourWayView(show: $showYourWayView)
                        
                    }
            }
            .position(x:150,y:135)
        }
        
    }
    

