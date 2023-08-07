import SwiftUI

// Die SwiftUI-View für die Onboarding-Seite.
struct OnBoardingView: View {
    
    // AppStorage, um den Zustand der Onboarding-Seite zu verfolgen (ob sie bereits angezeigt wurde oder nicht).
    @AppStorage("onBoarding") var onBoarding = true
    
    // Ein State-Property, um zu verfolgen, ob der Bildschirm "AfterOnBoarding" angezeigt werden soll.
    @State private var showAfterOnBoarding = false
    
    // Ein State-Property, um den aktuellen Schritt des Onboarding-Prozesses zu verfolgen.
    @State private var current = 1
    
    var body: some View {
        
        ZStack {
            // Hintergrundbild.
            Image("studentonroad")
                .resizable()
                .scaledToFit()
                .overlay(Rectangle())
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.black.opacity(0.55))
                .contrast(0.7)

            VStack(alignment: .center) {
                HStack {
                    // Button zum Fortfahren oder zum Beenden des Onboarding-Prozesses.
                    Button(action: {
                        onBoarding = false
                    }) {
                        Text("Continue")
                        Image(systemName: "chevron.right")
                    }
                    .background(
                        Capsule()
                            .fill(Color(.gray).opacity(0.2))
                            .frame(width: 60, height: 30)
                    )
                }
                
                // Anzeige des aktuellen Onboarding-Schritts (OnboardItem).
                if current == 1 {
                    OnboardItem(image: "hotel7", title: "Get your Inspiration", description: "find new Locations\nand lot of different Peoples\nlocally & globally of the World. ")
                        .transition(AnyTransition.slide.animation(.spring()))
                        .animation(.default)
                }
                
                if current == 2 {
                    OnboardItem(image: "grand_canyon", title: "Discover new \nLocations", description: "Explore new Locations\nand booking easyier your Holidays. ")
                        .transition(AnyTransition.slide.animation(.spring()))
                        .animation(.default)
                }
                
                if current == 3 {
                    OnboardItem(image: "familiebackground", title: "Share your \nMoments", description: "Share you trip\nwith your Family and Friends.\nLet’s make the travel fun & and full\nof exciting adventures")
                        .transition(AnyTransition.slide.animation(.spring()))
                        .animation(.default)
                }
                
                // Anzeige der Indikatoren und des Fortschritts (dots).
                HStack {
                    HStack(spacing: 12) {
                        Capsule()
                            .frame(width: 18, height: 4)
                            .foregroundColor(current == 1 ? Color("green") : Color("green").opacity(0.3))
                        
                        Capsule()
                            .frame(width: 18, height: 4)
                            .foregroundColor(current == 2 ? Color("green") : Color("green").opacity(0.3))
                        
                        Capsule()
                            .frame(width: 18, height: 4)
                            .foregroundColor(current == 3 ? Color("green") : Color("green").opacity(0.3))
                    }
                    
                    Circle()
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color("green"))
                        .overlay(
                            // Anzeige eines Häkchens, wenn der letzte Schritt erreicht ist, sonst eines Pfeils.
                            Image(systemName: current == 3 ? "checkmark" : "arrow.right")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                        )
                        .onTapGesture {
                            // Bei einem Klick auf den Kreis wird entweder zum nächsten Schritt gewechselt oder der Bildschirm "AfterOnBoarding" wird angezeigt.
                            if current == 3 { // Neuer Code hinzugefügt
                                showAfterOnBoarding = true
                            } else {
                                withAnimation {
                                    current += 1
                                }
                            }
                        }
                }
            }
        }
    }
}

// Die Preview-Provider für die `OnBoardingView`.
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
