import SwiftUI

struct SearchBarView3: View {
    // Binding an eine Text-Eigenschaft, die von außerhalb der Ansicht bereitgestellt wird
    @Binding var text: String
    // Platzhaltertext, der angezeigt wird, wenn das Textfeld leer ist
    var placeholder: String

    var body: some View {
        // Horizontale Stack-Ansicht zur Erstellung der Suchleisten-Benutzeroberfläche
        HStack {
            // Vergrößerungsglas-Symbol auf der linken Seite der Suchleiste
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            // Textfeld zum Eingeben des Suchtexts
            TextField(placeholder, text: $text)
                .foregroundColor(.primary)
            
            // Löschen-Schaltfläche 'xmark.circle.fill', um den Text zu löschen, wenn er nicht leer ist
            if !text.isEmpty {
                Button(action: {
                    text = "" // Wenn darauf getippt wird, wird der Suchtext gelöscht
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding() // Füge um die Suchleiste herum Abstand hinzu
        .background(Color(.systemGray6)) // Setze die Hintergrundfarbe der Suchleiste
        .cornerRadius(8) // Wende abgerundete Ecken an, um eine leicht abgerundete Form zu erzeugen
        .padding(.horizontal) // Füge horizontalen Abstand um die Suchleiste herum hinzu
    }
}
