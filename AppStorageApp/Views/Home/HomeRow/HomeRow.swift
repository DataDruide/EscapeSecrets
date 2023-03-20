
import SwiftUI


struct HomeRow: View {
    @EnvironmentObject var authService : AuthService
    @StateObject var reiseViewModel: ReiseAuswahlViewModel = ReiseAuswahlViewModel()
    
    @State private var searchText = ""
    @State private var showMenu = false
    @State private var showNextView = false


    var body: some View {
        ZStack {
            Image("BG 1")
                .resizable()
                .ignoresSafeArea(.all)
                .frame(maxHeight: .infinity)
            
        
            
            
            VStack {
                HStack {
                    
                    
                    Button("LogOut") {
                        self.showNextView = true

                        authService.signOut()
                    }
                    .foregroundColor(.red)
                    .bold()
                    .font(.system(size: 20))
                    .multilineTextAlignment(.leading)
                    .padding()
                    
                    .sheet(isPresented: $showNextView) {
                        YourWayView( show: $showNextView)
                    }
                    
                    Text("TravelPortal")
                        .font(.system(size: 34))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.purple)
                   
                    
                }
                HStack {
                    Image("pictureProfil")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .opacity(1)
                    
                    
                    Text("Hi nice to see you again ... \(authService.user?.email ?? "")!")
                        .foregroundColor(.purple)
                        .font(.system(size: 15))
                        .padding()
                }
                
                NavigationStack {
                    VStack {
                        Text("Topseller")
                            .font(.subheadline)
                            .font(.system(size: 24))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.purple)
                        


                        ScrollView() {
                            NavigationLink(destination: HotelDetailRow1().environmentObject(ReiseAuswahlViewModel())) {
                                CountryDetailView(imageName: "grand_canyon", hotelName:  "Rom",stars: "star.fill" ,price: 650)
                            }
                            NavigationLink(destination: HotelDetailRow2()) {
                                CountryDetailView(imageName: "eiffel_tower", hotelName:  "St.Hilton",stars: "star.fill" ,price: 450)
                            }
                            NavigationLink(destination: HotelDetailRow3()) {
                                CountryDetailView(imageName: "Rome", hotelName:  "Rome come here and find out",stars: "star.fill" ,price: 250)
                            }
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
