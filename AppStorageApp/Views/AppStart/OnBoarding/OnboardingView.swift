import SwiftUI

struct OnBoardingPageOne: View {
    
    @AppStorage("splash") var current = 1
       
       var body: some View {
           VStack(alignment: .leading) {
               
               HStack {
                   Spacer()
                   
                   Button(action: {
                       current = 4
                   }, label: {
                       Text("skip")
                           .font(.callout)
                           .fontWeight(.semibold)
                           .foregroundColor(.white)
                   })
                   .background(
                       Capsule()
                           .fill(Color(.gray).opacity(0.2))
                           .frame(width: 60, height: 30)
                   )
                   .padding(.trailing, 20)
               }.padding()
               
               if current == 1 {
                   OnboardItem(image: "img1", title: "Connect with \ncompanys", description: "Connect with companys and lot of different Peoples locally & globally. Discover Chat & Engage")
                       .transition(AnyTransition.slide.animation(.spring()))
                       .animation(.default)
               }
               
               if current == 2 {
                   OnboardItem(image: "img2", title: "Discover new \nlocations", description: "Explore new locations and booking easyier your Holidays. ")
                       .transition(AnyTransition.slide.animation(.spring()))
                       .animation(.default)
               }
               
               if current == 3 {
                   OnboardItem(image: "img3", title: "Share your \nTripmoments", description: "Share you trip with your Community and Friends. Let’s make the travel fun & a lot of adventures")
                       .transition(AnyTransition.slide.animation(.spring()))
                       .animation(.default)
               }
               
               HStack {
                   HStack(spacing: 12) {
                       Capsule()
                           .frame(width: 18, height: 4)
                           .foregroundColor(current == 1 ? Color("Purple") : Color("Purple").opacity(0.3))
                       
                       Capsule()
                           .frame(width: 18, height: 4)
                           .foregroundColor(current == 2 ? Color("Purple") : Color("Purple").opacity(0.3))
                       
                       Capsule()
                           .frame(width: 18, height: 4)
                           .foregroundColor(current == 3 ? Color("Purple") : Color("Purple").opacity(0.3))
                   }
                   
                   Spacer()
                   
                   Circle()
                       .frame(width: 56, height: 56)
                       .foregroundColor(Color("Purple"))
                       .overlay(
                           Image(systemName: current == 3 ? "checkmark" : "arrow.right")
                               .font(.system(size: 20, weight: .bold))
                               .foregroundColor(.white)
                       )
                       .onTapGesture {
                           withAnimation {
                               current += 1
                           }
                       }
                   
                   
               }
               .padding(20)
           }
       }
   }

struct OnBoardingPageOne_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPageOne()
    }
}


struct OnboardItem: View {
    
    var image: String = ""
    var title: String = ""
    var description: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
            
            Image(image)
                .resizable()
                .padding(20)
                .scaledToFit()
            
            Spacer()
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .kerning(0.8)
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                
            
            Text(description)
                .font(.callout)
                .foregroundColor(.gray)
                .padding(.vertical, 5)
                .padding(.leading, 20)
            
            Spacer()
        }
    }
}

struct OnboardItem_Previews: PreviewProvider {
    
    static var previews: some View {
        OnboardItem()
    }
}
