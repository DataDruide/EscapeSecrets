import SwiftUI

struct CircleGroupView: View {
    // MARK: - EIGENSCHAFTEN
    
    @State var ShapeColor: Color // Die Farbe der Kreise
    @State var ShapeOpacity: Double // Die Transparenz der Kreise
    @State private var isAnimating: Bool = false // Ein Zustand, um die Animation zu steuern
    
    // MARK: - ANSICHT
    
    var body: some View {
        ZStack {
            // Erster Kreis mit bestimmter Farbe und Transparenz
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            // Zweiter Kreis mit bestimmter Farbe und Transparenz
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: ZSTACK
        .blur(radius: isAnimating ? 0 : 10) // Blur-Effekt, wenn isAnimating false ist
        .opacity(isAnimating ? 1 : 0) // Ändert die Opazität, wenn isAnimating true ist
        .scaleEffect(isAnimating ? 1 : 0.5) // Ändert die Skalierung, wenn isAnimating true ist
        .animation(.easeOut(duration: 1), value: isAnimating) // Animations-Effekt beim Erscheinen, basierend auf isAnimating
        .onAppear(perform: {
            isAnimating = true // Setzt isAnimating auf true, wenn die Ansicht erscheint, um die Animation zu starten
        })
    }
}

// MARK: - VORSCHAU

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            CircleGroupView(ShapeColor: .yellow, ShapeOpacity: 0.2) // Vorschau mit bestimmter Farbe und Transparenz
        }
    }
}
