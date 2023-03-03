//
//  ShowHomeView.swift
//  AppStorageApp
//
//  Created by Marcel Zimmermann on 01.03.23.
//

import SwiftUI

struct ShowHomeView: View {
    let theDescription: String
    let imageName: String
    let reiseURL: String
    @State private var showHotel = false


    var body: some View {
        ZStack{
            GifImage("logo")
                .ignoresSafeArea()
            Color.orange.opacity(0.1)
                .ignoresSafeArea()

            VStack {
                ScrollView {
                    Text(.init(theDescription))
                        .padding()
                }
                
                // 1 Button
                Button(action: {
                    self.showHotel = true
                }) {
                    Text("Hotels")
                    
                }.padding()
                    .accentColor(Color.orange)
                    .foregroundColor(.black)
                    .frame(maxWidth: 200)
                    .frame(height: 60)
                    .background(Color.orange).opacity(0.8)
                    .cornerRadius(8)
                    .padding(.bottom, 15)
                
                
                    .sheet(isPresented: $showHotel) {
                        HotelView()
                        
                        
                    }
                
                
                Spacer()
                
                Link(
                    destination: URL(string: "https://www.example.com/TOS.html")!,
                    label: {
                        ZStack {
                            Image( imageName)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                                .scaleEffect(0.9)
                            
                            Text("Click image for more description")
                                .foregroundColor(.indigo)
                                .font(.headline)
                                .padding()
                                .background(
                                    Capsule()
                                        .fill(Color.orange
                                            .opacity(0.55))
                                )
                        }
                    })
            }
            }
        }
    }


struct ShowHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ShowHomeView(
            theDescription: """
**Ingredients**

Über diese Unterkunft

Genießen Sie den herrlichen Panoramablick auf den Strand Choeng Mon und die Insel Ko Fan. Die Villa Rapha ist eine moderne Luxusvilla mit privatem Infinity-Pool. Das Hotel liegt ideal in der bestehenden Wohnanlage Horizon Villas, nur wenige Gehminuten vom Strand Choeng Mon und eine kurze Fahrt von Chaweng.

 Fisherman's Village und dem Flughafen entfernt. 1000 Mbit/s Glasfaser-Breitband, WLAN, Netflix und IPTV mit Hunderten von internationalen Live-TV-Kanälen und kostenlosen Filmen auf Anfrage.

Die Unterkunft

Villa Rapha ist eine Luxusvilla, die entworfen wurde, um den atemberaubenden Panoramablick auf das Meer in vollen Zügen zu genießen. Es verfügt über 4 Schlafzimmer, alle mit eigenem Bad und Meerblick. Die Villa Rapha ist mit ihrem privaten Infinity-Pool, modernem Interieur und großzügigen Unterkünften Ihr ideales Inselhaus.

Villa Rapha richtet sich an Familien oder Freunde, die sich nach einem geräumigeren und persönlicheren Urlaubserlebnis sehnen. Perfekt zum Entspannen in privaten oder unterhaltsamen Gästen sorgen die hochmodernen Einrichtungen für einen unvergesslichen und angenehmen Aufenthalt.

Als Teil der bestehenden geschlossenen Wohnanlage der Horizon Villas haben Gäste vollen Zugang zu den Gemeinschaftseinrichtungen, zu denen ein Tennisplatz und ein Fitnessraum gehören.

Live

Im Herzen der Villa Rapha befindet sich der große offene Wohn- und Essbereich mit zweifachen Türen, die sich vollständig auf eine private Poolterrasse öffnen.
""",
            imageName: "greece",
            reiseURL: "https://www.inspiredtaste.net/15938/easy-and-smooth-hummus-recipe/")
    }
}

