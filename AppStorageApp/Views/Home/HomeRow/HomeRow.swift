
import SwiftUI


struct HomeRow: View {
    @EnvironmentObject var authService : AuthService
    @StateObject var reiseViewModel: ReiseAuswahlViewModel = ReiseAuswahlViewModel()
    
    @State private var searchText = ""
    @State private var showMenu = false
    @State private var showNextView = false
    @State private var showDetail1 = false
    @State private var showDetail2 = false
    @State private var showDetail3 = false
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    var body: some View {
        ZStack {
            Image("BG 1")
                .resizable()
                .ignoresSafeArea()
                .frame(maxHeight: .infinity)

         
            VStack {
                HeaderView()
                
                
                PromotionView()
                
            }
            
        }
        
    }
    
}
        struct HomeRow_Previews: PreviewProvider {
            static var previews: some View {
                HomeRow().environmentObject(AuthService())
            }
        }
    
