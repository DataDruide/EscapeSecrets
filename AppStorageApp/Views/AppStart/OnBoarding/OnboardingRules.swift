

import SwiftUI
// Hier regeln wir die Onboardregeln
struct OnboardingRules: View {
    
    @EnvironmentObject var authService : AuthService // Zugänglichkeit zum AuthService
    @AppStorage("onBoarding")  var onBoarding = true // Speichert den Onboardingprozess (true sagt aus OnBoarding läuft noch)
    
    
    // ###### Werden mit Benötigt zum Verhaltensprozess
    @State private var showLoginView = false // Speichern Zustand der View
    
    @State private var RestartOnboarding = false  // Speichern Zustand der View

    var body: some View {
        VStack {
            if onBoarding {
                OnBoardingView()
            } else {
                Group{
                    if authService.user != nil{ // nicht leer ist
                        Home() // dann zeig mir Home an
                    }else{
                        AfterOnBoarding() // ansonsten AfterOnboarding View
                            .transition(.opacity.animation(.default))
                        
                    }
                }.onAppear{ // Beim Erscheinen der View (onAppear) wird die Funktion listenToAuthState aufgerufen, die zum Abhören des Authentifizierungsstatus im AuthService dient.
                    authService.listenToAuthState()
                }
               
            }
        }
    }
}

struct OnboardingRules_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingRules()
    }
}
