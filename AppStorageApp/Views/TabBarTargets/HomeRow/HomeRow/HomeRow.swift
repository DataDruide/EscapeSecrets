import SwiftUI
import Foundation

struct HomeRow: View {
    @State var text: String = ""
    
    @State private var showDetailPlaceView = false
    @State private var showShapeOne = false
    
    
    
    var body: some View {
        
        let favoriteTargets = [
                FavoriteTargets(name: "Malediven", imageName: "malediven"),
                FavoriteTargets(name: "Spain", imageName: "spain"),
                FavoriteTargets(name: "Thailand", imageName: "thailand")
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
                }, label: {
                    Image(systemName: "figure.walk.arrival")
                        .font(.headline)
                        .foregroundColor(.red)
                        .blur(radius: 0.5)
                        .shadow(color: .gray, radius: 0.55, x: 0.25, y: 0.25)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 16)
                    
                })
                .shadow(radius: 10)
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
                    
                    Text("Explore the beautiful sides of Italy\n and take a closer look at the\n country and its people")
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
                                                red: 75 / 255,
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
                        
                        FloatingActionButton()
                        .position(x:40,y:30)
//                            .padding(.trailing, 16)
//                            .padding(.bottom, 60)
                   // Spacer()
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
                    .position(x:80, y:78) // hier stellt man den grünen Rahmen auf ihre richtige Position
                    
                    VStack(alignment: .center) {
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack(spacing: 16) {
                                ForEach(favoriteTargets, id: \.self) { favoriteTargets in
                                    NavigationLink(destination: DetailPopularDestinationView(name: "Malediven", imageName: "malediven")) {
                                        Image(favoriteTargets.imageName)
                                            .resizable()
                                            .frame(width: 150, height: 210)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                            .padding(.bottom)
                        }
                        .padding(.bottom, 0)
                    }
                    
                }
            }
            .background(Color.black.opacity(0.75))
            .ignoresSafeArea()
        }
    }
}

    struct HomeRow_Previews: PreviewProvider {
        static var previews: some View {
            HomeRow()
        }
    }

