
import SwiftUI

struct SearchBarHomeRow: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Where are you going?", text: $text)
                .padding(8)
                .background(Color(.black).opacity(0.5))
                .cornerRadius(10)
                .padding(.leading, 10)
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill").foregroundColor(.secondary)
                }
            }
        }
        .padding(.horizontal)
    }
}

