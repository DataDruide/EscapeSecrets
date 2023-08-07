import SwiftUI

struct DetailPopularDestinationView: View {
    // Properties
    let name: String
    let imageName: String
    
    // State
    @State private var selectedImage: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Anzeige des ausgewählten Bildes oder des Standardbildes
                Image(selectedImage == "" ? imageName : selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height / 3)
                    .padding(.top, 20)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Überschrift "Ihr Land im Detail"
                        Text("Your Country in Detail")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.yellow)
                            .padding(.top, 20)

                        // Section "Location"
                        Text("Location:")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Here, you can provide a brief description of the country's location.")

                        // Section "Region"
                        Text("Region:")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Here, you can provide a brief description of the country's region.")

                        // Section "People"
                        Text("People:")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Here, you can provide a brief description of the country's population.")

                        // Section "Jobs"
                        Text("Jobs:")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Here, you can provide a brief description of the job opportunities in the country.")

                        // Heading "Companies with Existing Locations"
                        Text("Companies with Existing Locations")
                            .font(.headline)
                            .fontWeight(.bold)

                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        // Zeige die PopularCompanysView
                        PopularCompanysView()
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 1.5)
            }
            .onAppear {
                selectedImage = imageName // Setze das Standardbild, wenn die Ansicht erscheint
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct DetailPopularDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPopularDestinationView(name: "Paris", imageName: "eiffel_tower")
    }
}
