//
//  DashRow1.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 16.03.23.
//

import SwiftUI

struct Shape1: View {
    
    // Die showYourWayView-Eigenschaft wird als @State deklariert, um Änderungen zu verfolgen
    @State private var showYourWayView = false
    
    // Die authService-Eigenschaft wird als @EnvironmentObject deklariert, um auf ein globales Objekt zuzugreifen
    @EnvironmentObject var authService: AuthService
    
    // Die showMenu- und showNextView-Eigenschaften werden als @State deklariert, aber in diesem Code nicht verwendet
    @State private var showMenu = false
    @State private var showNextView = false
    
    // Die username-Eigenschaft wird als Parameter der View definiert
    var username: String
    
    var body: some View {
        // Ein Farbverlauf wird als Hintergrund festgelegt
        LinearGradient(colors: [.black.opacity(0.77),.black.opacity(0.87)], startPoint: .topLeading, endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all) // Ignoriere die sichere Area
        // Eine CardView, die die darin enthaltene Ansicht rahmt
        CardViewShape1 {
            // Eine ZStack-Ansicht, die andere Ansichten übereinander stapelt
            ZStack {
                // Ein Farbverlauf wird als Hintergrund festgelegt
                LinearGradient(colors: [.black.opacity(0.77),.black.opacity(0.87)], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all) // Ignoriere die sichere Area
                VStack {
                    
                    Text("Wollen Sie sich abmelden dann klicken Sie auf die Schaltfläche unten.")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.all)
                        .cornerRadius(50)
                    
                    HStack {
                        // Eine Schaltfläche, die bei Klick die showYourWayView-Eigenschaft auf true setzt und authService.signOut() aufruft
                        Button(action: {
                            self.showYourWayView = true
                            authService.signOut()
                        }) {
                            HStack {
                                Image(systemName: "figure.walk.arrival") // Ein Bild
                                Text(authService.user?.email ?? "") // Ein Text
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(
                                        Color(
                                            red: 175 / 255,
                                            green: 115 / 255,
                                            blue: 115 / 255
                                        )
                                    )
                            )
                            .foregroundColor(.white) // Textfarbe
                            .cornerRadius(15) // Abrundung der Ecken
                            .blur(radius: 0.5) // Ein Blur-Effekt
                            .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25) // Ein Schatten-Effekt
                        }
                        // Ein sheet View, das angezeigt wird, wenn die showYourWayView-Eigenschaft true ist
                        .sheet(isPresented: $showYourWayView) {
                            AfterOnBoarding()
                        }
                    }
                }
            }
        }
    }
}


// Eine Preview-Struktur, um eine Vorschau der View in der Xcode-Preview-Ansicht zu sehen
struct Shape1_Previews: PreviewProvider {
    static var previews: some View {
        Shape1(username: "Max Mustermann")
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
