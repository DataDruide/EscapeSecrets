import SwiftUI

// Definition der SwiftUI-View "EmptyStateView"
struct EmptyStateView: View {
    var body: some View {
        ZStack {
            // Ein Farbverlauf wird als Hintergrund festgelegt
            LinearGradient(colors: [.white, .gray, Color.black.opacity(0.19)], startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                // Anzeige eines Symbolbilds aus dem SF-Symbols-System ("graduationcap.circle")
                Image(systemName: "graduationcap.circle")
                    .foregroundColor(.orange)
                    .font(.system(size: 85))
                    .padding(.bottom)
                
                // Anzeige eines mehrzeiligen Texts
                Text("Wenn du nach einer Reise- und Arbeitsstelle suchst,\nbist du hier genau richtig.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer()
            }
            .padding()
            .foregroundColor(Color(.white)) // Festlegung der Textfarbe im gesamten VStack
        }
    }
}

// Definition der Preview für die EmptyStateView
struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView() // Anzeige der EmptyStateView in der Vorschau
    }
}
