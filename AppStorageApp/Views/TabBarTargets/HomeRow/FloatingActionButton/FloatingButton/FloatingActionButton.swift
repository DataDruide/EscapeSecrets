import SwiftUI

struct FloatingActionButton: View {
    @State var showMenu = false
    @State var CreatedMemberViewIsShowing = false

    var body: some View {
        VStack {
            Spacer()
            if showMenu {
                VStack {
                    NavigationLink(destination: CreateProfilView()) {
                        MenuItem(icon: "person.crop.circle")
                    }
                    
                    NavigationLink(destination: BookingRow()) {
                        MenuItem(icon: "ticket")
                    }
                    
                    NavigationLink(destination: VideoAssistentView()) {
                        MenuItem(icon: "video")
                    }
                    
                    NavigationLink(destination: CreatedMemberView(CreatedMemberViewIsShowing: $CreatedMemberViewIsShowing, memberDataViewModel: MemberDataViewModel())) {
                        MenuItem(icon: "person.fill.checkmark")
                    }
                   
                }
                .transition(.customSlide) // Apply the custom transition here
            }
            Button(action: {
                self.showMenu.toggle()
            }) {
                Image(systemName: "ticket")
                    .frame(width: 45, height: 45)
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color(red: 25/255, green: 25/255, blue: 25/255))
                    .background(Circle())
                    .foregroundColor(.yellow.opacity(0.5))
                    .shadow(color: .gray, radius: 0.5, x: 1, y: 1)
            }
        }
    }
}

// Define a custom transition animation
extension AnyTransition {
    static var customSlide: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
            .animation(.spring())
        let removal = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
            .animation(.spring())
        return .asymmetric(insertion: insertion, removal: removal)
    }
}


struct MenuItem: View {
    var icon: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(red: 200/255, green: 200/255, blue: 200/255))
                .frame(width: 45, height: 45)
            Image(systemName: icon)
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.black)
                .opacity(0.65)
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
