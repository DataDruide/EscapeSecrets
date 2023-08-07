import SwiftUI

// Eine einzelne SwiftUI-View, die ein Onboarding-Element darstellt.
struct OnboardItem: View {
    
    // Die Bild-, Titel- und Beschreibungstexte für das Onboarding-Element.
    var image: String = ""
    var title: String = ""
    var description: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            
            // Platzhalter-Spacer, um den Inhalt vertikal zu zentrieren.
            Spacer()
            
            // Das Bild des Onboarding-Elements.
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(20)
                .scaledToFill()
                .blur(radius: 0.5)
                .cornerRadius(30)
            
            // Platzhalter-Spacer, um den Inhalt vertikal zu zentrieren.
            Spacer()
            
            // Der Titel des Onboarding-Elements.
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .kerning(0.8) // Anpassung des horizontalen Abstands zwischen Buchstaben in einem Text.
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .foregroundColor(.yellow)
            
            // Die Beschreibung des Onboarding-Elements.
            Text(description)
                .font(.callout)
                .foregroundColor(.gray)
                .padding(.vertical, 5)
                .multilineTextAlignment(.center)
                
            // Platzhalter-Spacer, um den Inhalt vertikal zu zentrieren.
            Spacer()
        }
    }
}

// Die Preview-Provider für die `OnboardItem`.
struct OnboardItem_Previews: PreviewProvider {
    static var previews: some View {
        OnboardItem()
    }
}
