import SwiftUI
import Foundation

struct HomeRow: View {
    @State var text: String = ""
    
    @State private var showDetailPlaceView = false
    @State private var showShapeOne = false


    
    var body: some View {
        
        let favoriteTarget : [FavoriteTargets] = [
            .init(name: "Malediven", imageName: "Malediven"),
            .init(name: "thailand", imageName: "Bali 1"),
            .init(name: "spain", imageName: "spain")
            
        ]
        
        NavigationStack {
            ZStack {
                Image("roma")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 650).opacity(0.8)
                    .position(x:196,y:250)
                
                // Button
                Button(action: {
                    self.showShapeOne = true
                }) {
                    HStack {
                        Image(systemName: "figure.walk.arrival")
                            .font(.headline)
                            .foregroundColor(.orange)
                            .blur(radius: 0.5)
                            .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                       
                    }
                    .padding()
                    .background(Circle())
                   // Color.green
                    .cornerRadius(10)
                    .shadow(radius: 10)
                }
                .offset(x: -150, y: -345) // Position des Buttons auf der Z-Ebene
                .sheet(isPresented: $showShapeOne) {
                    Shape1(username: "authService")
                }

                
                VStack(alignment: .center) {
              
                        SearchBarHomeRow(text: $text)
                            .position(x:250, y:30)
                            .opacity(1.05)
                            .blur(radius: 0.8)
                            .shadow(color: .gray, radius: 0.65, x: 0.35, y: 0.35)
                            .foregroundColor(.white)
                            .padding(50)
                    Text("La Italia")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .bold()
                        .font(.system(size: 34))
                        .position(x:220, y:20)
                        .opacity(1.05)
                        .blur(radius: 0.5)
                        .shadow(color: .gray, radius: 0.65, x: 0.35, y: 0.35)
                    
                    Text("Explore the beautiful sides of Italy and take a closer look at the country and its people")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 18))
                        .position(x:180, y:0)
                        .opacity(1.05)
                        .blur(radius: 0.5)
                        .shadow(color: .gray, radius: 0.65, x: 0.35, y: 0.35)
                        .font(.subheadline)
                        .padding()
                    VStack() {
                        
                        // 1 Button
                        Button(action: {
                            self.showDetailPlaceView = true
                        }, label: {
                            Text("Read more")
                                .font(.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .blur(radius: 0.5)
                                .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                                .padding(.horizontal, 50)
                                .padding(.vertical, 16)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(
                                            Color(
                                                red: 255 / 255,
                                                green: 115 / 255,
                                                blue: 115 / 255
                                            )
                                        )
                                )
                        })
                        .shadow(radius: 10)
                        .sheet(isPresented: $showDetailPlaceView) {
                            DetailPlaceView()
                        }
                    }
                    Spacer()
                    Spacer()
                    
                    VStack {
                        // Füge einen Text hinzu.
                        Text("Favorite Places")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 120 )
                            .padding(.vertical, 16)
                    } // VStack
                    // Setze den Hintergrund mit einer Kapselform und einem Farbverlauf.
                    .background(LinearGradient(colors: [.green, .clear], startPoint: .topLeading, endPoint: .bottomTrailing), in: Capsule())
                    .shadow(color: .black.opacity(0.6), radius: 5, x:15, y: 50)
                    .position(x:80, y:50) // hier stellt man den grünen Rahmen auf ihre richtige Position
                    
                    VStack(alignment: .center) {
                        ScrollView(.horizontal) {
                            HStack() {
                                ForEach(favoriteTarget) { target in
                                    NavigationLink(destination: DetailPopularDestinationView(name: target.name, imageName: target.imageName)) {
                                        Image(target.imageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 0)// Set the bottom padding to 0
                        
                    }
                    
                }
            }
            .background(Color.black.opacity(0.75))
        }
    }
    
}
    struct HomeRow_Previews: PreviewProvider {
        static var previews: some View {
            HomeRow()
        }
    }

