
import SwiftUI

struct PopularCompanysView: View {
    // Erstelle eine Liste von Firmen, die angezeigt werden sollen.
    let companies: [Company] = [
        .init(name: "Ankara GmbH", imageName: "ankara"),
        .init(name: "NO4711", imageName: "4711"),
        .init(name: "companytagline GmbH", imageName: "companytagline")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Horizontale Anordnung für Titel und "See all" Text.
            HStack {
                // Linke Titelüberschrift
                Text("Promoted Companies")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.orange)
                Spacer()
                // Rechter "See all" Text
                Text("See all")
                    .font(.system(size: 11, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            .foregroundColor(.orange)
            
            // Horizontale ScrollView für die Darstellung der Unternehmen
            ScrollView(.horizontal) {
                HStack(spacing: 15.0) {
                    // Iteriere über jede Firma in der companies-Liste.
                    ForEach(companies, id: \.self) { company in
                        // Jede Firma wird in einem VStack angezeigt.
                        VStack() {
                            // Firmenbild
                            Image(company.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .cornerRadius(60)
                            // Firmenname
                            Text(company.name)
                                .font(.system(size: 10, weight: .semibold))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 100)
                        .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        .padding(.bottom)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct PopularCompanysView_Previews: PreviewProvider {
    static var previews: some View {
        PopularCompanysView()
    }
}
