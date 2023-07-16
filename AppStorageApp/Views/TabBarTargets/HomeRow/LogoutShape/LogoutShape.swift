//
//  DashRow1.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 16.03.23.
//

import SwiftUI

struct LogoutShape: View {
    
    @State private var showYourWayView = false
    @EnvironmentObject var authService: AuthService
    
    @State private var showMenu = false
    @State private var showNextView = false
    
    var username: String
    
    var body: some View {
        CardViewShape1 {
            ZStack {
                Image("studenten")
                    .resizable()
                    .overlay(Rectangle().foregroundColor(.clear))
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(.black.opacity(0.15))
                    .contrast(0.7)
                    .offset(x: -0)
                    .opacity(01.05)
                
                LinearGradient(colors: [.black.opacity(0.47),.black.opacity(0.67)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .overlay(
                            VStack {
                                Text("Wollen Sie sich abmelden dann klicken Sie auf die Schaltfläche unten.")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.all)
                                    .cornerRadius(50)
                                
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
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .foregroundColor(
                                                    Color(
                                                        red: 25 / 255,
                                                        green: 115 / 255,
                                                        blue: 115 / 255
                                                    )
                                                )
                                        )
                                        .foregroundColor(.white)
                                        .cornerRadius(15)
                                        .blur(radius: 0.5)
                                        .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                                        
                                    }
                                }
                            }
                                .padding()
                        )
                }
            }
        }
    }
    
    
    // Eine Preview-Struktur, um eine Vorschau der View in der Xcode-Preview-Ansicht zu sehen
    struct Shape1_Previews: PreviewProvider {
        static var previews: some View {
            LogoutShape(username: "Max Mustermann")
                .environmentObject(AuthService()) // Fügt ein EnvironmentObject hinzu, um die AuthService-Instanz zu verwenden
        }
    }
    
    struct CardViewShape1<Content: View>: View {
        
        let content: Content
        
        init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }
        
        var body: some View {
            content
                .background(Color.clear) // Hintergrundfarbe auf transparent setzen
                .ignoresSafeArea(.all)
            //  .cornerRadius(20)
        }
    }
}
