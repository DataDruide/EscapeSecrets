import SwiftUI

// Die SwiftUI-View für den Splash Screen.
struct SplashView: View {
    
    // Ein State-Property, das den Zustand des Splash Screens verfolgt.
    @State private var isActive = false
    
    var body: some View {
        // Die View entscheidet basierend auf dem Zustand, ob sie den Hauptinhalt (ContentView) oder den Splash Screen anzeigt.
        if isActive {
            // Wenn der Zustand aktiv ist, wird der Hauptinhalt (ContentView) angezeigt.
            ContentView()
        } else {
            // Wenn der Zustand inaktiv ist, wird der Splash Screen angezeigt.
            ZStack {
                // Hintergrundbild für den Splash Screen.
                Image("willcomebild")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                    .animation(.easeInOut(duration: 1.9))
                    .transition(.scale)
                
                VStack {
                    Spacer()
                    // Ein Bild, das auf dem Splash Screen angezeigt wird.
                    Image("03")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.75)
                        .frame(width: 380, height: 450)
                        .cornerRadius(230)
                        .foregroundColor(.blue)
                        .scaleEffect(isActive ? 1.5 : 0.7)
                        .animation(Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true))
                        .onAppear {
                            // Nach einer Verzögerung von 4 Sekunden wird der Zustand auf aktiv gesetzt, um den Hauptinhalt anzuzeigen.
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                withAnimation {
                                    self.isActive = true
                                }
                            }
                        }
                    
                    Spacer() // Leerraum, um das Bild nach oben zu verschieben.
                }
            }
        }
    }
}

// Die Preview-Provider für die `SplashView`.
struct Previews_SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
