

import SwiftUI

struct SearchBarView: View {
    
    // Bindet die searchText Eigenschaft aus einer anderen View ein
    @Binding var searchText : String
    
    var body: some View {
        VStack(alignment: .center, spacing:10){
           
                // Searchbar mit Lupe
                
                TextField("Text here...",text: $searchText)
                .frame(maxWidth: 250, maxHeight: 45)
                .background(Color.black.opacity(0.7))
                .foregroundColor(
                    searchText.isEmpty ? Color(.white): Color(.orange))
                .shadow(color: .gray, radius: 0.5, x: 1.00, y: 1)
                .blur(radius: 0.5)
                .cornerRadius(15)
                    
            
            // Legt den Abstand und die Schriftgröße des Views fest
            .padding()
            .font(.headline)
            
            
        }
        .position(x: 300)
    }
}
struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
