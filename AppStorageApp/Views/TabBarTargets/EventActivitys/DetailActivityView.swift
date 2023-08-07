
import SwiftUI
import MapKit // Framework was es uns ermöglicht Karten anzuzeigen 

// Die DetailActivityView repräsentiert die Ansicht einer bestimmten Aktivität, die näher beschrieben wird
struct DetailActivityView: View {

var activity : Activities // Die Aktivität, die in dieser Ansicht dargestellt wird

@EnvironmentObject var tripType : TripTypeViewModel // Die TripType-Umgebung, die die hinzugefügten Aktivitäten enthält

@State var mapRegion : MKCoordinateRegion // Die Region der Karte, die angezeigt wird

// Initialisierungsfunktion
init(activity:Activities){
    self.activity = activity
    self._mapRegion = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: activity.latitude, longitude: activity.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
}

// Body-View
var body: some View {
    ZStack {
        // Ein Farbverlauf wird als Hintergrund festgelegt
        LinearGradient(colors: [.black.opacity(0.97),.black.opacity(0.97)], startPoint: .topLeading, endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all)
          
        VStack{
            VStack(alignment: .center,spacing: 10){
                
                HStack(alignment: .top){
                    // Bild der Aktivität
                    Image(activity.image)
                        .resizable()
                        .frame(width: 400, height: 300)
                        .cornerRadius(15)
                        .blur(radius: 0.3)
                        .shadow(color: .black, radius: 20, x: 0, y: 10)

                }
                VStack {
                    // Name der Aktivität
                    Text(activity.name)
                        .font(.title)
                        .foregroundColor(.orange)
                        .fontWeight(.black)
                        .blur(radius: 0.3)
                        .shadow(color: .black, radius: 20, x: 0, y: 10)
                    
                    // Beschreibung der Aktivität
                    Text(activity.description)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                                           
                    
                    // Karte mit der angegebenen Region
                    Map(coordinateRegion:$mapRegion)
                        .cornerRadius(30)
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                        .frame(height: 250)
                }
                HStack(alignment: .top){
                    Spacer()
                    
                    // Button, um die Aktivität zur TripType-Umgebung hinzuzufügen
                    Button(action: {
                        tripType.addActivities(newItem: activity)
                    })
                    {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.green.opacity(0.4))
                            .shadow(color: .gray, radius: 20, x: 0, y: 10)
                            .blur(radius: 0.3)
                            .frame(width: 120, height: 60)
                            .font(.title)
                            .overlay(HStack{
                                Text("Event Booking")
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.white)
                                    

                            }).padding()
                    }
                    
                    Spacer()
                }
                
            }
            .ignoresSafeArea()
            .padding()
        }.edgesIgnoringSafeArea(.top)
    }
}
}

// Preview-Provider
struct DetailExperienceView_Previews: PreviewProvider {
static let tripTide = TripTypeViewModel()
@Namespace static var namespace
static var previews: some View {
DetailActivityView(activity: activities[0])
.environmentObject(tripTide)
}
}
