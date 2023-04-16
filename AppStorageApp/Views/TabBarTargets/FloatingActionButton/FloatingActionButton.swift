import SwiftUI
struct FloatingActionButton: View {
    @State var showMenu = false
    
    var body: some View {
        VStack {
            Spacer()
            if showMenu {
                VStack {
                    NavigationLink(destination: CreateProfilView()) {
                        MenuItem(icon: "person.crop.circle")
                    }
                    
                    NavigationLink(destination: MultiBookingView()) {
                        MenuItem(icon: "ticket")
                    }
                   
                }
            }
            Button(action: {
                self.showMenu.toggle()
            }) {
                Image(systemName: "pencil.tip.crop.circle.badge.plus")
                    .frame(width: 60, height: 60)
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color(red: 1/255, green: 1/255, blue: 1/255))
                    .background(Circle())
                    .shadow(color: .gray, radius: 0.5, x: 1, y: 1)
            }
        }
    }
}

struct MenuItem: View {
    var icon: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(red: 75/255, green: 115/255, blue: 115/255))
                .frame(width: 60, height: 60)
            Image(systemName: icon)
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.black)
        }
        .shadow(color: .gray, radius: 0.3, x: 1, y: 1)
        .transition(.move(edge: .trailing))
        .padding()
    }
}

struct FloatingActionButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingActionButton()
    }
}
