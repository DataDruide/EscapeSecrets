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
                    NavigationLink(destination: JobRow(viewModel: JobListViewModel())) {
                        MenuItem(icon: "briefcase")
                    }
                    NavigationLink(destination: MultiBookingView()) {
                        MenuItem(icon: "ticket")
                    }
                    NavigationLink(destination: CheckListView(CheckListViewIsShowing: $showMenu)) {
                        MenuItem(icon: "checklist")
                    }
                }
            }
            Button(action: {
                self.showMenu.toggle()
            }) {
                Image(systemName: "pencil.tip.crop.circle.badge.plus")
                    .frame(width: 60, height: 60)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color(red: 193/255, green: 202/255, blue: 05/255))
                    .shadow(color: .gray, radius: 0.3, x: 1, y: 1)
            }
        }
    }
}

struct MenuItem: View {
    var icon: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255))
                .frame(width: 55, height: 55)
            Image(systemName: icon)
                .aspectRatio(contentMode: .fit)
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
