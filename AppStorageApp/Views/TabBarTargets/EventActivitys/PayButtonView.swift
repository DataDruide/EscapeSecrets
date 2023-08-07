import SwiftUI

struct PayButtonView: View {
    // Zustandseigenschaft, die verwendet wird, um die Animation des Buttons zu steuern
    @State private var isAnimating: Bool = false

    var body: some View {
        // Die Hauptansicht, die den Pay-Button enthält
        VStack() {
            // Kopfbereich des Buttons mit einem Zirkel-Hintergrund und dem Button-Text
            ZStack {
                CircleGroupView(ShapeColor: .green, ShapeOpacity: 0.1) // Hintergrund mit Kreisen
                
                Button(action: {
                    // Aktion des Buttons: Hier wird ein Sound abgespielt, wenn der Button getippt wird
                    withAnimation {
                        playSound(sound: "success", type: "m4a") // Funktion zum Abspielen des Sounds
                    }
                }) {
                    // Button-Inhalt: Symbol und Text
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    
                    Text("Paymentprocess")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                } //: BUTTON
                .buttonStyle(.borderedProminent) // Stil des Buttons
                .buttonBorderShape(.capsule) // Form des Buttons (Kapsel)
                .controlSize(.large) // Größe des Buttons
                .blur(radius: 0.5) // Weichzeichnen des Buttons
                .shadow(color: .gray, radius: 20, x: 0, y: 10) // Schatten hinzufügen
            } //: ZSTACK (Kopfbereich)
            .onAppear(perform: {
                // Animation des Buttons: Starten der Animation, wenn die Ansicht erscheint
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    isAnimating = true
                })
            })
        }
    }
}
