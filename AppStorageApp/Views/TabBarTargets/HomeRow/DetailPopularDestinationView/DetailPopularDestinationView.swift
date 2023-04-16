import SwiftUI
import Alamofire

import SwiftUI

struct DetailPopularDestinationView: View {
    let name: String // stores the name of the popular destination
    let imageName: String // stores the name of the image file for the popular destination
    
    var body: some View {
        GeometryReader { geometry in // get the size of the parent view
            VStack {
                Image(imageName)
                    .resizable() // make the image resizable
                    .aspectRatio(contentMode: .fit) // fill the image to the edges
                    .frame(width: geometry.size.width, height: geometry.size.height / 3) // set the size of the image to one third of the parent view height
                    .padding(.top, 20) // add some top padding to the image
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Ihr Land im Detail ")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.top, 20) // add some top padding to the text
                        
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
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        
                    }

                }
                .frame(width: geometry.size.width, height: geometry.size.height / 1.5) // set the size of the ScrollView to two thirds of the parent view height
            }
        }
      //  .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct DetailPopularDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPopularDestinationView(name: "Malediven", imageName: "Malediven")
    }
}
