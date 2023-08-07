
import SwiftUI


struct SearchBarView2: View {
    @Binding var searchTerm: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchTerm)
                .padding(.vertical, 10)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            
            Button(action: {
                self.searchTerm = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(.trailing, 10)
            }
        }
    }
}

