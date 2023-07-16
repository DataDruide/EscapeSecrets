

import SwiftUI // Framework

struct ContentView: View {
    @EnvironmentObject var authService : AuthService // Hier machen wir uns den AuthService zugänglich mit dem EnvironmentObject
  
    var body: some View {
        NavigationStack { // Ist ein Navigations Container und alle Objekte in dem Container erlauben eine Navigation
            
            
            ZStack {
                // Ein Farbverlauf wird als Hintergrund festgelegt
                LinearGradient(colors: [.black,.black,.black], startPoint: .topLeading, endPoint: .bottomLeading)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    OnboardingRules() // Hier rufen wir die Regeln auf wie sich die App beim ersten und 2 Start verhalten soll 
                }
            }
        }
    }
}
    

