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
                Image(selectedImage == "" ? imageName : selectedImage) // show the selected image or the default image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height / 3)
                    .padding(.top, 20)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Ihr Land im Detail ")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.top, 20)
                        
                        Text("Lage: ")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Hier können Sie eine kurze Beschreibung der Lage des Landes geben.")
                        
                        Text("Region: ")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Hier können Sie eine kurze Beschreibung der Region des Landes geben.")
                        
                        Text("Menschen: ")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Hier können Sie eine kurze Beschreibung der Bevölkerung des Landes geben.")
                        
                        Text("Jobs: ")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Hier können Sie eine kurze Beschreibung der Arbeitsmöglichkeiten im Land geben.")
                        
                        Text("Unternehmen die bereits einen Standort haben")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        PopularCompanysView()
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 1.5)
            }
            .onAppear {
                selectedImage = imageName // set the default selected image when the view appears
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct DetailPopularDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPopularDestinationView(name: "Paris", imageName: "eiffel_tower")
    }
}
