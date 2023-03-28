
import SwiftUI


struct HomeRow: View {
    @EnvironmentObject var authService : AuthService
  
    // Die drei Zustände für das Anzeigen von CheckListView, HotelListView und IconView
    @State private var CheckListViewIsShowing = false
    @State private var HotelListViewisShowing = false
    @State private var IconViewIsShowing = false
    
    var body: some View {
        
        ZStack {
            Image("BG 1")
                .resizable()
                .ignoresSafeArea(.all)
           
                VStack(alignment: .leading, spacing: 20) {
                    Shape1()
                    
                    // Hinzufügen von einem Button, um CheckListView anzuzeigen
                    HStack {
                        Button(action: {
                            withAnimation {
                                CheckListViewIsShowing = true
                            }
                        }) {
                            // Verwenden von RoundViews als Schaltfläche mit einem Info-Symbol
                            RoundViews(systemName: "info")
                        }
                        .sheet(isPresented: $CheckListViewIsShowing, onDismiss: {}, content: {
                            CheckListView(CheckListViewIsShowing: $CheckListViewIsShowing)
                        })
                        // Verwenden von .sheet um CheckListView zu präsentieren, wenn CheckListViewIsShowing true ist
                    }
                }
                .padding(.leading)
                .background(Image("BG 1"))
                Button(action:{
                    withAnimation{
                      IconViewIsShowing = true
                    }
                }){
                    Image("iphone120")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .frame(width: Constants.General.imageWidth,   height: Constants.General.imageHeight)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("TitleBackgroundColor"), lineWidth: Constants.General.lineWidth))
                    
                }.sheet(isPresented: $IconViewIsShowing, onDismiss: {}, content: {
                    IconView(IconViewIsShowing:$IconViewIsShowing)
                        
                })
                
            }
        }
                    
    }

        


        
    
    struct HomeRow_Previews: PreviewProvider {
        static var previews: some View {
            
            // Vorschau der HomeView in Portrait-Orientierung
            HomeRow()
            
                .previewInterfaceOrientation(.portrait)
            
            // Vorschau der HomeView in Landschafts-Orientierung mit Dunkelmodus
            HomeRow()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.landscapeRight)
            HomeRow().environmentObject(AuthService())

        }
    }
