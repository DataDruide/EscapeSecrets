import SwiftUI

// Definition der SwiftUI-View "JobDetailView"
struct JobDetailView: View {
    @ObservedObject var job: JobViewModel // Beobachtetes ViewModel-Objekt für den Job
    
    @State private var isContactButtonPressed = false // Zustandsvariable für den Kontakt-Button
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                // Anzeige des Jobtitels
                Text(job.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                // Anzeige des Firmennamens
                Text("\(job.companyName)")
                    .font(.title2)
                    .foregroundColor(.purple.opacity(0.7))
                
                HStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        // Anzeige der Jobkategorie
                        Text((job.category == "") ? "Jobkategorie: N/A" :"Jobkategorie: \(job.category)")
                        
                        // Anzeige des Standorts
                        Text((job.location == "") ? "Standort: N/A" :"Standort: \(job.location)")
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        // Anzeige des Gehalts
                        Text((job.salary == "") ? "Gehalt: N/A" :"Gehalt: \(job.salary)")
                        
                        // Anzeige des Jobtyps
                        Text((job.jobType == "") ? "Jobtyp: N/A" :"Jobtyp: \(job.jobType)")
                    }
                }
                .font(.headline)
                .foregroundColor(.white)
                
                Divider() // Trennlinie
                
                // Anzeige des Veröffentlichungsdatums
                Text("Dieser Job wurde am \(job.postdate) veröffentlicht.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                // Kontakt-Button
                Button(action: {
                    self.isContactButtonPressed = true
                }) {
                    HStack {
                        Image(systemName: "paperplane.fill")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Text("Kontakt")
                            .fontWeight(.semibold)
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color(red: 75 / 255, green: 115 / 255, blue: 115 / 255))
                    )
                }
                .alert(isPresented: $isContactButtonPressed) {
                    Alert(
                        title: Text("Vielen Dank für Ihre Kontaktaufnahme"),
                        message: Text("Wir melden uns so bald wie möglich bei Ihnen."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.8))
            .cornerRadius(20)
            .padding()
            .navigationTitle(job.title) // Titel für die Navigationsleiste
            .navigationBarTitleDisplayMode(.inline) // Anzeigemodus für den Titel
        }
        .foregroundColor(.white) // Textfarbe für die gesamte View
    }
}
