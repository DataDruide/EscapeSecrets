import SwiftUI

// Die `JobView` ist eine SwiftUI-View, die ein einzelnes Job-Objekt anzeigt.
struct JobView: View {
    // Das `job`-ViewModel wird als `@ObservedObject` deklariert, um Änderungen zu beobachten.
    @ObservedObject var job: JobViewModel
    
    // Der `liked`-Status wird mit `@State` deklariert, um ihn in der View zu verwalten.
    @State var liked: Bool = false
    
    // `body` definiert die Darstellung der View.
    var body: some View {
        VStack {
            HStack {
                VStack {
                    // Zeigt den Titel des Jobs in einer größeren Schriftart und weißer Farbe an.
                    HStack {
                        Text(job.title)
                            .font(.title2)
                            .foregroundColor(Color(.white))
                    }
                    // Zeigt Informationen zum Gehalt, Ort und Jobtyp in kleinerer Schriftart und weißer Farbe an.
                    HStack {
                        Text((job.salary == "") ? "Salary: N/A" :"Salary: \(job.salary)")
                            .font(.footnote)
                            .foregroundColor(Color(.white))
                        Spacer()
                        Text((job.location == "") ? "Location: N/A" :"Location: \(job.location)")
                            .font(.footnote)
                            .foregroundColor(Color(.white))
                        Spacer()
                        Text((job.jobType == "") ? "Job Type: N/A" :"Job Type: \(job.jobType)")
                            .font(.footnote)
                            .foregroundColor(Color(.white))
                    }
                }
                .padding()
                
                // Ein Button mit einem Herz-Symbol, der den Status `liked` umkehrt, wenn er geklickt wird.
                Button(action: {
                    liked.toggle()
                }) {
                    Image(systemName: liked ? "heart.fill" : "heart")
                        .foregroundColor(Color.red)
                }
            }
        }
        // Hintergrund der View wird als LinearGradient von Schwarz zu Grau festgelegt, der den gesamten verfügbaren Bereich abdeckt.
        .background(LinearGradient(colors: [.gray.opacity(0.45), .gray.opacity(0.45), .gray.opacity(0.45)], startPoint: .topLeading, endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all))
    }
}

// Die `JobView_Previews`-Vorschau zeigt ein Beispiel-Job und das entsprechende `JobViewModel`.
struct JobView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleJob = Job(id: 1, title: "Software Engineer", companyName: "San Francisco, CA", category: "$120k - $150k", postdate: "Full-time", location: "Mercedes", salary: "Service", jobType: "Service")
        let jobViewModel = JobViewModel(job: exampleJob)
        return JobView(job: jobViewModel)
    }
}
