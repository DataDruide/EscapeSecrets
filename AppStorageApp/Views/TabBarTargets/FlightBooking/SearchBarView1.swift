
import SwiftUI

// SearchBar für die Flugsuche

struct SearchBarView1: View {
    @Binding var searchTerm: String
    
    var body: some View {
        HStack {
            
            
            Button(action: {
                self.searchTerm = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.black)

            }
            
            
            TextField("Search", text: $searchTerm)
                .padding(.vertical, 10)
                .padding(.horizontal, 25)
                .background(Color(.systemCyan))
                .cornerRadius(8)
                .padding(.horizontal)
            
        }

    }
}

