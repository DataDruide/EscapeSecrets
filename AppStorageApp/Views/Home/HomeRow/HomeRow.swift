
import SwiftUI


struct HomeRow: View {
    @EnvironmentObject var authService : AuthService
    @StateObject var reiseViewModel: ReiseAuswahlViewModel = ReiseAuswahlViewModel()
    
    @State private var searchText = ""
    @State private var showMenu = false
    @State private var showNextView = false


    var body: some View {
        ZStack {
            Image("Background_gradient")
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack {
                Text("Dein Dashboard")
                    .font(.system(size: 34))
                    .frame(maxWidth: .infinity)
                
                HStack {
                    Image("airbus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0.3)
                    
                    Button("LogOut") {
                        self.showNextView = true

                        authService.signOut()
                    }
                    .foregroundColor(.black)
                    .bold()
                    .font(.system(size: 8))
                    .multilineTextAlignment(.leading)
                    .padding()
                    
                    .sheet(isPresented: $showNextView) {
                        YourWayView( show: $showNextView)
                    }
                    
                    Text("Hi nice to see you again ... \(authService.user?.email ?? "")!")
                        .foregroundColor(.black)
                        .font(.system(size: 8))
                        .padding()
                }
                
                NavigationView {
                    List() {
                        NavigationLink(destination: HotelDetailRow1().environmentObject(ReiseAuswahlViewModel())) {
                            CountryDetailView(imageName: "grand_canyon", hotelName:  "Rom",stars: "star.fill" ,price: 650)
                        }
                        NavigationLink(destination: HotelDetailRow2()) {
                            CountryDetailView(imageName: "New York", hotelName:  "New York",stars: "star.fill" ,price: 450)
                        }
                        NavigationLink(destination: HotelDetailRow3()) {
                            CountryDetailView(imageName: "Rome", hotelName:  "Schöne Wohnung mit spektakulärem Meerblick",stars: "star.fill" ,price: 250)
                        }
                    }
                }
                
                
            }
        }
    }
}

struct HomeRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeRow().environmentObject(AuthService())
    }
}
