
import SwiftUI

struct ActivityButton: View {
    
    var name : String
    var image : String
    
    var body: some View {
        
        // Ein ZStack, um das Bild und den Text-Overlay zu stapeln
        ZStack(alignment: .bottom){
        
            // Ein skalierbares Bild, das das Symbol darstellt
            Image(image)
                .resizable(resizingMode: .stretch)
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .blur(radius: 0.5)
                .shadow(color: .gray, radius: 20, x: 0, y: 10)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color(.yellow), lineWidth: Constants.General.lineWidth))
            
            // Ein Rechteck, um den Text zu überlagern
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 150, height: 30)
                .overlay(
                    // Der Name der Aktivität in fett gedruckter Schrift
                    Text(name)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                )
            
            NavigationLink(destination: DetailActivityView(activity: Activities(name: name, image: image, description: "Beschreibung", price: 299, latitude: 0, longitude: 0))){
                // Ein transparenter Button, um den NavigationLink auszulösen
                Rectangle()
                    .opacity(0)
                    .frame(width: 150, height: 150)
            }
                
        }
    }
}



struct ActivityButton_Previews: PreviewProvider {
    static var previews: some View {
        ActivityButton(name: "Hiking", image: "hiking")
            .previewLayout(.fixed(width: 200, height: 200)) // Optionale Größeneinstellung für die Vorschau
    }
}
